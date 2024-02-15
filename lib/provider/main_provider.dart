import 'package:flutter/material.dart';

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

  void checkAttendDays() {
    //연속 출석 체크 로직
    _attendDays =
        _attendWeek.where((element) => element == true).length.toInt();
  }
}
