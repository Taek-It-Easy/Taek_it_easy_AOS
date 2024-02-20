import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:taek_it_easy/constants.dart';
import 'package:taek_it_easy/data/badge_item.dart';
import 'package:http/http.dart' as http;
import 'package:taek_it_easy/data/response.dart';
import 'package:taek_it_easy/prefs.dart';

class BadgeProvider with ChangeNotifier {
  final List<bool> _userBadgeList = [];
  List<bool> get userBadgeList => _userBadgeList;

  List<BadgeItem> _badgeList = [];
  List<BadgeItem> get badgeList => _badgeList;

  Future<void> init() async {
    await getBadgeList();
    await getUserBadge();
  }

  Future<void> getUserBadge() async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/app/badge/${Prefs.getInt("userIdx")}"),
      headers: Constants.headers,
    );
    print("테스트 : ${utf8.decode(response.bodyBytes)}");
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      var list = Response.fromJson(jsonDecode(result), (data) {
        List<BadgeItem> badgeItems = [];
        for (var item in data) {
          badgeItems.add(BadgeItem.fromJson(item));
        }
        return badgeItems;
      }).result;

      //값이 있으면 true로 변경
      for (var item in list) {
        _userBadgeList[item.badgeIdx - 1] = true;
      }
    }
  }

  Future<void> getBadgeList() async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/app/badge/all"),
      headers: Constants.headers,
    );
    print("테스트 : ${utf8.decode(response.bodyBytes)}");
    if (response.statusCode >= 200 && response.statusCode < 400) {
      var result = utf8.decode(response.bodyBytes);
      _badgeList = Response.fromJson(jsonDecode(result), (data) {
        List<BadgeItem> badgeItems = [];
        for (var item in data) {
          badgeItems.add(BadgeItem.fromJson(item));
        }
        return badgeItems;
      }).result;
    }

    //유저 뱃지 초기화 후, 총 뱃지 개수만큼 false 처리
    _userBadgeList.clear();
    for (int i = 0; i < _badgeList.length; i++) {
      _userBadgeList.add(false);
    }
  }

  Future<void> postBadge(int idx) async {
    Map<String, dynamic> string = {
      'badgeIdx': idx,
      'userIdx': Prefs.getInt("userIdx")
    };

    var body = jsonEncode(string);
    final response = await http.post(
        Uri.parse("${Constants.baseUrl}/app/badge/new"),
        headers: Constants.headers,
        body: body);
    print("테스트 : ${utf8.decode(response.bodyBytes)}");
  }
}
