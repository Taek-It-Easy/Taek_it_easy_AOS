import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    getModileId();
  }

  Future<String> getModileId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    String id = '';
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidDeviceInfo =
            await deviceInfoPlugin.androidInfo;

        id = androidDeviceInfo.id;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        id = iosDeviceInfo.identifierForVendor ?? '';
      }
    } on PlatformException {
      id = '';
    }
    print('id: $id');
    return id;
  }
}
