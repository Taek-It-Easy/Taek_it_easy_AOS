import 'package:flutter/material.dart';
import 'package:taek_it_easy/designSystem/color_system.dart';

class Fonts {
  static const title = TextStyle(
      fontSize: 48, fontWeight: FontWeight.w700, color: AppColors.black);

  static const loginTitle = TextStyle(
      letterSpacing: 1,
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static const loginSubTitle = TextStyle(color: Colors.white, fontSize: 25);
  static const mainTitle = TextStyle(
    color: AppColors.black,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static const mainSubTitle = TextStyle(
    color: Color(0xFF111111),
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 0.09,
    letterSpacing: -0.50,
  );
  static const mainSubTitleNum = TextStyle(
    color: Color(0xFF111111),
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 0.05,
    letterSpacing: -0.50,
  );

  static const mainMenuTitle = TextStyle(
    color: Color(0xFF111111),
    fontSize: 30,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
    letterSpacing: -0.50,
  );
}
