import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

class Constants {
  static const String baseUrl = 'http://35.212.254.58:9001';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json;charset=utf-8'
  };

  static const List<PoseLandmarkType> landmarkTypes = [
    PoseLandmarkType.nose,
    PoseLandmarkType.leftEye,
    PoseLandmarkType.rightEye,
    PoseLandmarkType.leftEar,
    PoseLandmarkType.rightEar,
    PoseLandmarkType.leftShoulder,
    PoseLandmarkType.rightShoulder,
    PoseLandmarkType.leftElbow,
    PoseLandmarkType.rightElbow,
    PoseLandmarkType.leftWrist,
    PoseLandmarkType.rightWrist,
    PoseLandmarkType.leftHip,
    PoseLandmarkType.rightHip,
    PoseLandmarkType.leftKnee,
    PoseLandmarkType.rightKnee,
    PoseLandmarkType.leftAnkle,
    PoseLandmarkType.rightAnkle,
  ];
}
