import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/widget/clear_indicator_widget.dart';
import 'package:taek_it_easy/view/widget/custom_button_widget.dart';
import 'package:taek_it_easy/view/widget/semicircle_pie_chart_widget.dart';

class FeedbackScorePage extends StatelessWidget {
  FeedbackScorePage({super.key, required this.page});

  int page = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Center(
          child: SemicirclePieChart(
            values: const [20, 30, 50],
            colors: [
              const Color(0xFF618273),
              Colors.grey.shade300,
              Colors.grey.shade200
            ],
            point: (provider.cameraResult[page].cdavg * 100).round(),
            comment: "Perfect!",
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset('assets/images/pose.png'),
              const SizedBox(
                width: 50,
              ),
              const Expanded(
                child: Column(
                  children: [
                    Text(
                      'Lower your arms further down',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, height: 1),
                      softWrap: true,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Stretch your feet forward',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold, height: 1),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
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
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
