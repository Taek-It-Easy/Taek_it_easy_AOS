import 'package:flutter/material.dart';

class PracticeViewModel with ChangeNotifier {
  int _basic = 1;
  int _poomsae = 1;

  final List<bool> _attendStatus = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

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

  int get basic => _basic;
  int get poomsae => _poomsae;

  List<bool> get basicClearStatus => _basicClearStatus;
  List<bool> get poomsaeClearStatus => _poomsaeClearStatus;
  List<bool> get attendStatus => _attendStatus;

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
