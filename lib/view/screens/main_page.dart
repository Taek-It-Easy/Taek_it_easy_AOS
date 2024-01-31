// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:taek_it_easy/view/screens/get_badge_page.dart';
import 'package:taek_it_easy/view/widgets/box_attend.dart';
import 'package:taek_it_easy/view/widgets/dialog_calendar.dart';
import 'package:taek_it_easy/view/widgets/dialog_custom.dart';
import 'package:taek_it_easy/viewModel/practice_view_model.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  late PracticeViewModel _practiceViewModel;

  @override
  Widget build(BuildContext context) {
    final dayName = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    _practiceViewModel = Provider.of<PracticeViewModel>(context, listen: false);

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                            colors: [Color(0xFF8DB9A5), Color(0x7F8DB9A5)],
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 60, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: 'Taek it easy!',
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: 24,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'You learned hard for ',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        height: 0.09,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Consumer<PracticeViewModel>(builder:
                                        (_, PracticeViewModel viewModel, __) {
                                      return Text(
                                        viewModel.attendStatus
                                            .where((element) => element == true)
                                            .length
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF111111),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          height: 0.05,
                                          letterSpacing: -0.50,
                                        ),
                                      );
                                    }),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'days',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        height: 0.09,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    //출석 상자
                    Container(
                      margin:
                          const EdgeInsets.only(top: 130, left: 16, right: 16),
                      padding: const EdgeInsets.all(5),
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.white, // 테두리 색상
                            width: 2.0, // 테두리 두께
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 4,
                              offset: Offset(3, 3),
                              spreadRadius: 1,
                            )
                          ]),

                      //출석체크
                      child: Row(
                        children: [
                          for (int i = 0; i < dayName.length; i++)
                            Consumer<PracticeViewModel>(
                                builder: (_, PracticeViewModel viewModel, __) {
                              return AttendBox(
                                dayName: dayName[i],
                                attendStatus: viewModel.attendStatus[i],
                              );
                            }),
                        ],
                      ),
                    ),
                    //리워드 (달성된 뱃지 개수)
                    Consumer<PracticeViewModel>(
                        builder: (_, PracticeViewModel viewModel, __) {
                      return Badge(
                        badgeAchieve: viewModel.badgeList.length,
                      );
                    }),
                  ],
                ),
                //3개 선택
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CustomDialog(
                                title: 'Basic: Jang1',
                                clearStatus: [
                                  true,
                                  true,
                                  true,
                                  true,
                                  false,
                                  false,
                                  false,
                                  false,
                                  false
                                ],
                              );
                            },
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              constraints: const BoxConstraints(minHeight: 85),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF111111)),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    constraints:
                                        const BoxConstraints(minHeight: 65),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(left: 5),
                                    decoration: const ShapeDecoration(
                                        color: Color(0xFF8DB9A5),
                                        shape: CircleBorder()),
                                    child: Image.asset(
                                      "assets/images/basic.png",
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(25),
                                    child: const Text(
                                      'Practice Basic',
                                      style: TextStyle(
                                        color: Color(0xFF111111),
                                        fontSize: 30,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 70),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Color(0xFF111111)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 1),
                                child: const Text(
                                  'Jang 1',
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  final int badgeAchieve;

  const Badge({super.key, required this.badgeAchieve});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GetBadgePage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                  color: const Color(0x2BCFF1E2).withOpacity(0.5),
                  shape: const OvalBorder(),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Image.asset('assets/images/medal.png'),
              ),
              CircularStepProgressIndicator(
                totalSteps: 9,
                currentStep: badgeAchieve,
                stepSize: 5,
                selectedColor: const Color(0xFF618273),
                unselectedColor: Colors.transparent,
                padding: 0,
                width: 103,
                height: 103,
                selectedStepSize: 5,
                roundedCap: (_, __) => true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
