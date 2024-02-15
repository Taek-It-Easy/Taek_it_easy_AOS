import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:http/http.dart' as http;
import 'package:taek_it_easy/data/response.dart';
import 'package:taek_it_easy/data/user.dart';
import 'package:taek_it_easy/prefs.dart';

class UserProvider {
  Future<void> postUser(int age) async {
    String deviceNum = await getModileId();

    Uri uri = Uri.parse("${Constants.baseUrl}/app/users/sign-up");

    Map<String, dynamic> body = {'deviceNum': deviceNum, 'userAge': age};

    final response = await http.post(uri,
        headers: Constants.headers, body: jsonEncode(body));

    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      print("로그인 Decode : ${jsonDecode(result)}");
      int? userIdx =
          Response.fromJson(jsonDecode(result), (json) => User.fromJson(json))
              .result
              .userIdx;
      print("값 : $userIdx");
      //Prefs.setInt("userIdx", userIdx);
    } else {
      //오류
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
