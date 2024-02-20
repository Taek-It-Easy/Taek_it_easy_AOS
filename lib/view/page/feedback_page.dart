import 'package:flutter/material.dart';
import 'package:taek_it_easy/view/page/badge_achieve_page.dart';
import 'package:taek_it_easy/view/widget/clear_indicator_widget.dart';
import 'package:taek_it_easy/view/widget/custom_button_widget.dart';
import 'package:taek_it_easy/view/widget/quit_button_widget.dart';

import 'feedback_score_page.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -0.5),
            colors: [Color(0xFF8DB9A6), Colors.white],
          ),
        ),
        child: Column(
          children: [
            const FeedbackScorePage(
              page: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const ClearIndicator(isclear: true, number: 1),
                  const SizedBox(width: 10),
                  const ClearIndicator(isclear: false, number: 2),
                  const SizedBox(width: 10),
                  const ClearIndicator(isclear: false, number: 3),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      label: 'Next',
                      icon: Icons.east,
                      color: const Color(0xFF8DB9A5),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BadgeAchievePage()));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20.0),
        child: QuitButton(),
      ),
    );
  }
}
