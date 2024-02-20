import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/utils/pose_detector_view.dart';
import 'package:taek_it_easy/view/page/feedback_page.dart';
import 'package:taek_it_easy/view/widget/custom_button_widget.dart';
import 'package:taek_it_easy/view/widget/quit_button_widget.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, provider, child) {
          if (provider.isDetectRunning) {
            return const PoseDetectorView();
          } else {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, -0.5),
                  colors: [Color(0xFF8DB9A6), Colors.white],
                ),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      provider.startDetect();
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      provider.submit().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeedbackPage()));
                      });
                    },
                  ),
                ],
              )),
            );
          }
        },
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(20.0),
        child: QuitButton(),
      ),
    );
  }
}
