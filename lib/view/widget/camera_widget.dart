import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/main.dart';
import 'package:taek_it_easy/provider/main_provider.dart';

class CameraView extends StatefulWidget {
  const CameraView(
      {super.key,
      required this.customPaint,
      required this.onImage,
      this.initialDirection = CameraLensDirection.front});

  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  State<CameraView> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraView> {
  late MainProvider provider;
  CameraController? _controller;
  int _cameraIndex = -1;
  bool _changingCameraLens = false; //방향 전환

  @override
  void initState() {
    super.initState();

    // 카메라 목록 중 설정한 카메라 렌즈 방향과 일치하는 카메라 선정
    if (cameras.any(
      (element) =>
          element.lensDirection == widget.initialDirection &&
          element.sensorOrientation == 90,
    )) {
      _cameraIndex = cameras.indexOf(
        cameras.firstWhere((element) =>
            element.lensDirection == widget.initialDirection &&
            element.sensorOrientation == 90),
      );
    } else {
      for (var i = 0; i < cameras.length; i++) {
        if (cameras[i].lensDirection == widget.initialDirection) {
          _cameraIndex = i;
          break;
        }
      }
    }

    if (_cameraIndex != -1) {
      startLiveFeed();
    }
  }

  @override
  void dispose() {
    stopLiveFeed();
    super.dispose();
  }

//렌즈 방향 전환
  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % cameras.length;

    // await _stopLiveFeed();
    // await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
        body: Stack(
      children: [
        liveFeedBody(),
        Positioned(
            top: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                _switchLiveCamera();
              },
              child: const Icon(
                Icons.screen_rotation_outlined,
                size: 24,
              ),
            ))
      ],
    ));
  }

  Widget liveFeedBody() {
    if (_controller?.value.isInitialized == false) {
      return Container();
    }

    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _controller!.value.aspectRatio;

    if (scale < 1) scale = 1 / scale;

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Transform.scale(
            scale: scale,
            child: Center(
                child: _changingCameraLens
                    ? const Center(
                        child: Text("Lens Changing..."),
                      )
                    : CameraPreview(_controller!)),
          ),
          if (widget.customPaint != null) widget.customPaint!,
        ],
      ),
    );
  }

  Future<void> startLiveFeed() async {
    final camera = cameras[_cameraIndex];

    _controller =
        CameraController(camera, ResolutionPreset.high, enableAudio: false);
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }

      _controller?.startImageStream((image) async {
        provider.videoSize(image.height, image.width);
        await processCameraImage(image);
      });
    });
  }

  Future<void> stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
  }

  Future<void> processCameraImage(CameraImage img) async {
    final WriteBuffer allBytes = WriteBuffer();

    for (final Plane plane in img.planes) {
      allBytes.putUint8List(plane.bytes);
    }

    final bytes = allBytes.done().buffer.asUint8List();

    final Size imageSize = Size(img.width.toDouble(), img.height.toDouble());
    final camera = cameras[_cameraIndex];

    final imageRotation =
        InputImageRotationValue.fromRawValue(camera.sensorOrientation);
    if (imageRotation == null) return;

    final inputImageFormat = InputImageFormatValue.fromRawValue(img.format.raw);
    if (inputImageFormat == null) return;

    final planeData = img.planes.map((e) {
      return e.bytesPerRow;
    });

    final inputImageData = InputImageMetadata(
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: planeData.first);
    print("사이지 측정: ${inputImageData.size}");
    final inputImage =
        InputImage.fromBytes(bytes: bytes, metadata: inputImageData);

    widget.onImage(inputImage);
  }
}
