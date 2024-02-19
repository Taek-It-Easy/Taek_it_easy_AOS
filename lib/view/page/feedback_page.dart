import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/widget/clear_indicator_widget.dart';
import 'package:taek_it_easy/view/widget/custom_button_widget.dart';
import 'package:taek_it_easy/view/widget/quit_button_widget.dart';
import 'package:taek_it_easy/view/widget/semicircle_pie_chart_widget.dart';

import 'feedback_score_page.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, -0.5),
            colors: [Color(0xFF8DB9A6), Colors.white],
          ),
        ),
        child: FeedbackScorePage(
          page: 1,
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20.0),
        child: QuitButton(),
      ),
    );
  }
}
