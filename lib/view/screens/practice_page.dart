// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/view/widgets/button_custom.dart';
import 'package:taek_it_easy/view/widgets/button_quit.dart';
import 'package:taek_it_easy/viewModel/practice_provider.dart';
import '../widgets/text_sub_title_widget.dart';
import '../widgets/text_title_widget.dart';

class PracticePage extends StatelessWidget {
  PracticePage({super.key});

  late PracticeProvider _practiceProvider;

  @override
  Widget build(BuildContext context) {
    _practiceProvider = Provider.of<PracticeProvider>(context, listen: false);
    _practiceProvider.getPoseVideo();

    return MaterialApp(
        home: Scaffold(
      body: Container(
        //배경 그라데이션
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Color(0xFF8DB9A6), Colors.white],
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF8DB9A6), Colors.white],
                        ),
                        border: Border.all(
                            color: const Color(0xFF436355), width: 2),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(1, 4),
                            spreadRadius: 1,
                          )
                        ],
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: TextTitleWidget(title: "basic"),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 24),
                            child: Center(
                              child: TextSubTitleWidget(title: "Action 1"),
                            ),
                          )
                        ],
                      ))),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF436355), width: 2),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(1, 4),
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          label: 'Replay',
                          icon: Icons.replay,
                          color: const Color(0xFFC1C1C1),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: CustomButton(
                          label: 'Next',
                          icon: Icons.east,
                          color: const Color(0xFF8DB9A5),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20.0),
        child: QuitButton(),
      ),
    ));
  }
}
