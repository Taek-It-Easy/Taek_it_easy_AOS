import 'dart:ffi';

import 'package:flutter/material.dart';

class PracticeViewModel with ChangeNotifier {
  bool _isOpenCalendar = false;

  bool get isOpenCalendar => _isOpenCalendar;

  int _basic = 1;
  int _poomsae = 1;

  int get basic => _basic;
  int get poomsae => _poomsae;

  final List<bool> _attendStatus = [
    true,
    false,
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
}
