import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  int? _age = null;

  int? get age => _age;

  void setAge(int newAge) {
    _age = newAge;
    notifyListeners();
    print("나이 : $age");
  }
}
