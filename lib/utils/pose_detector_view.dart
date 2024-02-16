import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:taek_it_easy/view/widget/camera_widget.dart';
import 'package:taek_it_easy/view/widget/pose_painter_widget.dart';

class PoseDetectorView extends StatefulWidget {
  const PoseDetectorView({super.key});

  @override
  State<PoseDetectorView> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  final PoseDetector _poseDetector = PoseDetector(
      options: PoseDetectorOptions(model: PoseDetectionModel.accurate));

  bool _canProcess = true;
  bool _isBusy = false;

  CustomPaint? _customPaint;

  Map<String, double> inputMap = {};

  @override
  void dispose() async {
    _canProcess = false; //화면 종료 시 진행 불가 판정
    _poseDetector.close(); //디텍터 종료
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
        customPaint: _customPaint,
        onImage: ((inputImage) {
          processImage(inputImage);
        }));
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;

    List<Pose> poses = await _poseDetector.processImage(inputImage);

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = PosePainter(
          poses, inputImage.metadata!.size, inputImage.metadata!.rotation);
      _customPaint = CustomPaint(
        painter: painter,
      );
    } else {
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
