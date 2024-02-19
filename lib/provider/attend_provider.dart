import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taek_it_easy/prefs.dart';

class AttendProvider with ChangeNotifier {
  List<bool?> _attendList = [false, false, false, false, false, false, false];
  List<bool?> get attendList => _attendList;

  String? _recentDate;
  String? get recentDate => _recentDate;

  int _continueDate = 1;
  int get continueDate => _continueDate;

  //Pref 에서 가져오기
  Future<void> init() async {
    _continueDate = Prefs.getInt("ContinueDate") ?? 1; //값 없으면 1로 초기화
    stringToWeekList(); //일주일 출석 정보 가져오기
    _recentDate = Prefs.getString("RecentDate");
    await attend();
  }

  Future<void> attend() async {
    DateTime now = DateTime.now(); //오늘 날짜
    if (_recentDate != null) {
      DateTime dateTime =
          DateFormat('yyyy-MM-dd').parse(_recentDate!); //가장 최근 출석일
      Duration diff = now.difference(dateTime);

      if (diff.inDays < 2) {
        //최근 출석일 이후 하루만 지났을 때
        _continueDate++;
      } else if (diff.inDays >= 2 && diff.inDays < 7) {
        //최근 출석일 이후 2일 이상 7일 미만 지났을 때
        _continueDate = 1;
        final diffWeek = now.day - dateTime.day;
        if (diffWeek < 0) {
          clearWeek();
        }
      } else if (diff.inDays >= 7) {
        //최근 출석일 이후 7일 이상 지났을 때
        _continueDate = 1;
      } else {
        //당일 재접속
      }
    } else {
      //최근 접속일이 없을 때
    }

    checkWeek(now.weekday);
    Prefs.setString("RecentDate", DateFormat('yyyy-MM-dd').format(now));
    Prefs.setInt("ContinueDate", continueDate);
    weekListToString();
  }

  void clearWeek() {
    _attendList = [false, false, false, false, false, false, false];
  }

  void checkWeek(int weekDay) {
    _attendList[weekDay - 1] = true;
  }

  void weekListToString() {
    String stringList =
        attendList.map((element) => element.toString()).join('_');
    Prefs.setString("WeekAttend", stringList);
  }

  void stringToWeekList() {
    String? stringList = Prefs.getString("WeekAttend");

    if (stringList != null) {
      _attendList = stringList.split('_').map((e) {
        e == 'null' ? null : e == 'true';
      }).toList();
    } else {
      _attendList = [false, false, false, false, false, false, false];
    }
  }
}
