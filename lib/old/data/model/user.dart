import 'dart:convert';

class User {
  final String deviceNum;
  final int userAge;

  User({required this.deviceNum, required this.userAge});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(deviceNum: json['deviceNum'], userAge: json['userAge']);
  }

    Map<String, dynamic> toJson() {
    return {
      'deviceNum': deviceNum,
      'userAge': userAge,
    };
  }
}
