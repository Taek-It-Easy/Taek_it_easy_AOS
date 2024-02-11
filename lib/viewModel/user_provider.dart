import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:taek_it_easy/data/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:taek_it_easy/prefs.dart';

class UserProvider with ChangeNotifier {
  late User _user;
  User get user => _user;

  Future<void> postUser() async {
    String deviceNum = await getModileId();

    Uri endPoint = Uri.parse("${Constants.baseUrl}/app/users/sign-up");
    final response = await http.post(endPoint,
        headers: Constants.headers,
        body: jsonEncode(User(deviceNum: deviceNum, userAge: 10)));
    try {
      int? userIdx = jsonDecode(response.body)['result']['userIdx'];
      print("$userIdx in Provider");
      if (userIdx != null) {
        Prefs.setInt("userIdx", userIdx);
      }
    } catch (e) {
      print('Error occurred: $e');
    }
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
    return id;
  }
}
