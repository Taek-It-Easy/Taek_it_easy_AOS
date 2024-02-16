import 'package:flutter/material.dart';
import 'package:taek_it_easy/utils/pose_detector_view.dart';
import 'package:taek_it_easy/view/widget/quit_button_widget.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PoseDetectorView(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: QuitButton(),
      ),
    );
  }
}
