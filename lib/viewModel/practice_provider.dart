import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:taek_it_easy/data/model/pose_item.dart';
import 'package:http/http.dart' as http;
import 'package:taek_it_easy/prefs.dart';

class PracticeProvider with ChangeNotifier {
  bool _isOpenCalendar = false;

  bool get isOpenCalendar => _isOpenCalendar;

  int _basic = 1;
  int _poomsae = 1;

  int get basic => _basic;
  int get poomsae => _poomsae;

  final List<bool> _attendStatus = [
    true,
    true,
    true,
    false,
    false,
    false,
    false,
  ];

  final String _basicTitle = "Basic: Jang 1";
  String get basicTitle => _basicTitle;

  final List<bool> _basicClearStatus = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<bool> _poomsaeClearStatus = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<bool> get basicClearStatus => _basicClearStatus;
  List<bool> get poomsaeClearStatus => _poomsaeClearStatus;
  List<bool> get attendStatus => _attendStatus;

  final List<Badge> _badgeList = [];
  List<Badge> get badgeList => _badgeList;

  void openCalendar() {
    _isOpenCalendar = true;
  }

  void selectBasic(int i) {
    _basic = i;
  }

  void selectPoomsae(int i) {
    _poomsae = i;
  }

  //기본 동작 클리어 시 동작
  void attend(int i) {
    _attendStatus[i] = true;
  }

  //기본 동작 클리어 시 동작
  void clearBasic(int i) {
    _basicClearStatus[i] = true;
  }

  //품새 클리어 시 동작
  void clearPoomsae(int i) {
    _poomsaeClearStatus[i] = true;
  }

  //실제 사용 변수들
  late List<PoseItem> _poseList = [];
  List<PoseItem> get poseList => _poseList;

  int _poomsaeIdx = 0;
  int get poomsaeIdx => _poomsaeIdx;

  int _poseIdx = 0;
  int get poseIdx => _poseIdx;

  final int _currentPoseIdx = 0;
  int get currentPoseIdx => _currentPoseIdx;

  //포즈 리스트 가져오기
  Future<void> getPoseList() async {
    try {
      final response = await http.get(
        Uri.parse("${Constants.baseUrl}/app/poses"),
        headers: Constants.headers,
      );
      print("POSE : ${json.decode(response.body)}");
      List<dynamic> body = json.decode(response.body);
      _poseList = parsePoseItems(body);
      //_poseList = body.map((dynamic item) => PoseItem.fromJson(item).toList());

      notifyListeners();
    } catch (e) {
      e;
    }
  }

  //유저 진행상황 가져오기
  Future<void> getUserContent() async {
    try {
      final response = await http.get(
        Uri.parse(
            "${Constants.baseUrl}/app/users/contents/${Prefs.getInt("userIdx")}"),
        headers: Constants.headers,
      );
      final body = utf8.decode(response.bodyBytes);
      print("body: $body / ${jsonDecode(response.body)}");
      _poomsaeIdx = jsonDecode(response.body)['poomsaeIdx'];
      _poseIdx = jsonDecode(response.body)['poseIdx'];
      print("진행 상황 : $poomsaeIdx / $poseIdx");
    } catch (e) {
      e;
    }
  }

  List<PoseItem> parsePoseItems(List<dynamic> jsonList) {
    List<PoseItem> poseItems = [];
    for (var json in jsonList) {
      poseItems.add(PoseItem.fromJson(json));
    }
    return poseItems;
  }

  Future<void> getPoseVideo() async {
    try {
      final response = await http.get(
          Uri.parse("${Constants.baseUrl}/app/video/$currentPoseIdx"),
          headers: Constants.headers);

      final body = utf8.decode(response.bodyBytes);
      print("body pose video : $body");
    } catch (e) {
      e;
    }
  }
}
