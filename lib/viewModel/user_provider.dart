import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:taek_it_easy/data/model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  late User _user;
  User get user => _user;

  Future<void> postUser() async {
    Uri endPoint = Uri.parse("${Constants.baseUrl}/app/users/sign-up");
    _user = User(deviceNum: "12300", userAge: 12);
    final response = await http.post(endPoint,
        headers: Constants.headers, body: jsonEncode(user));
  }
}
