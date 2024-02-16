// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/designSystem/color_system.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/widget/badge_widget.dart';
import 'package:taek_it_easy/view/widget/practice_menu_widget2.dart';

import '../widget/attend_widget.dart';
import '../widget/practice_menu_widget1.dart';
import '../widget/practice_menu_widget3.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  late MainProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MainProvider>(context, listen: false);

    final dayName = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    provider.checkAttendDays();

    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 160,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-1.00, -0.00),
                          end: Alignment(1, 0),
                          colors: [AppColors.mainGreen, Color(0x7F8DB9A5)],
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(top: 50, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Taek it easy!",
                              style: Fonts.mainTitle,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 24,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  const Text(
                                    'You learned hard for ',
                                    style: Fonts.mainSubTitle,
                                  ),
                                  Text(provider.attendDays.toString(),
                                      style: Fonts.mainSubTitleNum),
                                  const Text(
                                    ' days',
                                    style: Fonts.mainSubTitle,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                AttendSection(
                  dayName: dayName,
                  attendStatus: provider.attendWeek,
                ),
                BadgeWidget(badgeAchieve: provider.badgeAchieve),
              ],
            ),
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PracticeMenuWidget1(),
                  PracticeMenuWidget2(),
                  PracticeMenuWidget3(),
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
