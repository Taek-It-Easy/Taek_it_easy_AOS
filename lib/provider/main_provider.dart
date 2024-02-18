// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:taek_it_easy/data/pose_item.dart';
import 'package:http/http.dart' as http;
import 'package:taek_it_easy/data/practice_status.dart';
import 'package:taek_it_easy/data/response.dart';
import 'package:taek_it_easy/data/user_content.dart';
import 'package:taek_it_easy/prefs.dart';

class MainProvider with ChangeNotifier {
  //연속 출석 일자
  int _attendDays = 1;
  int get attendDays => _attendDays;

  //주간 출석
  final List<bool> _attendWeek = [true, true, true, false, false, false, false];
  List<bool> get attendWeek => _attendWeek;

  //Badge List
  final int _badgeAchieve = 3;
  int get badgeAchieve => _badgeAchieve;

  //동작 연습 (동작 리스트, 동작 달성 인덱스)
  int _userPoseIdx = 3;
  int get userPoseIdx => _userPoseIdx; //유저의 진행 상황(기본 동작)

  int _userPoomsaeIdx = 0;
  int get userPoomsaeIdx => _userPoomsaeIdx; //유저의 진행 상황(품새)

  List<PoseItem> _poseList = [];
  List<PoseItem> get poseList => _poseList;

  final List<PracticeStatus> _clearStatus = [];
  List<PracticeStatus> get clearStatus => _clearStatus;

  int _currentPoseIdx = 0;
  int get currentPoseIdx => _currentPoseIdx;

  void checkAttendDays() {
    //연속 출석 체크 로직
    _attendDays =
        _attendWeek.where((element) => element == true).length.toInt();
  }

  Future<void> getContent() async {
    await getPoseList();
    await getUserContent();
    await setClearStatus();
    notifyListeners();
  }

  //포즈 리스트 가져오기
  Future<void> getPoseList() async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/app/poses"),
      headers: Constants.headers,
    );
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      _poseList = Response.fromJson(jsonDecode(result), (data) {
        List<PoseItem> poseItems = [];
        for (var item in data) {
          poseItems.add(PoseItem.fromJson(item));
        }
        return poseItems;
      }).result;
    }
  }

//진행 상황 가져오기
  Future<void> getUserContent() async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/app/users/contents/1"),
      headers: Constants.headers,
    );
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      try {
        final body = Response.fromJson(
            jsonDecode(result), (json) => UserContent.fromJson(json));

        _userPoseIdx = body.result.poseIdx;
        _userPoomsaeIdx = body.result.poomsaeIdx;
      } catch (e) {
        print(e);
      }
    }
  }

//클리어 정보 담기
  Future<void> setClearStatus() async {
    _clearStatus.clear();
    for (int i = 0; i < _poseList.length; i++) {
      if (i < userPoseIdx) {
        _clearStatus.add(PracticeStatus.complete);
      } else if (i == userPoseIdx) {
        _clearStatus.add(PracticeStatus.inProgress);
      } else {
        _clearStatus.add(PracticeStatus.incomplete);
      }
    }
  }

  //포즈 달성 시 작동
  Future<void> patchPoseAchieve() async {
    final response = await http.get(
      Uri.parse(
          "${Constants.baseUrl}/app/users/poses/${Prefs.getInt("userIdx")}/1"),
      headers: Constants.headers,
    );
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      _poseList = Response.fromJson(jsonDecode(result), (data) {
        List<PoseItem> poseItems = [];
        for (var item in data) {
          poseItems.add(PoseItem.fromJson(item));
        }
        return poseItems;
      }).result;
    }
  }

  //Pose 선택
  Future<void> setPoseIdx(int poseIdx) async {
    _currentPoseIdx = poseIdx;
    setVideoUrl();
  }

  //Video 관련
  String _videoUrl = "";
  bool _isPlaying = false;
  String _videoTitle = '';

  String get videoUrl => _videoUrl;
  bool get isPlaying => _isPlaying;
  String get videoTitle => _videoTitle;

  Future setVideoUrl() async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/app/video/$_currentPoseIdx"),
      headers: Constants.headers,
    );

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      try {
        final body = Response.fromJson(
            jsonDecode(result), (json) => PoseItem.fromJson(json));
        _videoTitle = body.result.poseName;
        _videoUrl = body.result.url ?? '';
      } catch (e) {
        //print(e);
      }
    }
    _isPlaying = false;
    notifyListeners();
  }

  void playVideo() {
    _isPlaying = true;
    notifyListeners();
  }

  void restartVideo() {
    _isPlaying = false;
    notifyListeners();
  }

//Pose Detector
  final List<PoseListItem> _poseDetectList = []; //감지한 포즈의 총 리스트
  List<PoseListItem> get poseDetectList => _poseDetectList;

  int _pOrder = 0;
  int get pOrder => _pOrder;

  void clearPoseDetectList() {
    _poseDetectList.clear();
    _pOrder = 0;
  }

  void addPoseDetectList(List<Pose> poses) {
    List<PoseData> _poseList = []; //각 시간 별 좌표값

    for (var pose in poses) {
      for (var landmark in pose.landmarks.values) {
        _poseList.add(PoseData(
            position: landmark.type.toString(),
            reliability: landmark.likelihood,
            x: landmark.x,
            y: landmark.y,
            z: landmark.z));
      }
    }

    _poseDetectList.add(PoseListItem(
        pOrder: pOrder, poseList: _poseList, time: DateTime.now().toString()));
    _pOrder++;
    if (_pOrder % 120 == 0) {
      postCameraCosine();
    }
  }

  Future<void> postCameraCosine() async {
    print("여기는 오나?");
    var string = CameraReq(poseIdx: currentPoseIdx, poseList: _poseDetectList);

    var body = jsonEncode(string);

    final response = await http.post(
        Uri.parse("${Constants.baseUrl}/app/camera/cosine"),
        headers: Constants.headers,
        body: body);
    print("여기는 오나?2");
    var result = utf8.decode(response.bodyBytes);

    print("?? $result");
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      try {} catch (e) {
        print("에러 $e");
      }
    }
  }
}
