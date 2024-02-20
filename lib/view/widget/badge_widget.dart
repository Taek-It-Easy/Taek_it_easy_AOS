// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:taek_it_easy/provider/badge_provider.dart';
import 'package:taek_it_easy/view/page/badge_collection_page.dart';

class BadgeWidget extends StatelessWidget {
  final int badgeAchieve;

  const BadgeWidget({super.key, required this.badgeAchieve});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BadgeProvider>(context, listen: false);

    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          provider.init().then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BadgeCollectionPage()),
              ));
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
