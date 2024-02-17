import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final bool isPlaying;

  const VideoWidget(
      {super.key, required this.videoUrl, required this.isPlaying});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initailizedController;

  @override
  void initState() {
    print("videoUrl : ${widget.videoUrl}");
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _initailizedController = _controller.initialize();
    if (widget.isPlaying) {
      _controller.play();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("너 몇 번 실행되니?");
    if (widget.videoUrl != oldWidget.videoUrl) {
      _controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      _controller.initialize().then((_) {
        if (widget.isPlaying) {
          _controller.play();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initailizedController,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 로딩바 표시
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // 에러가 발생한 경우 에러 메시지 표시
          print("무슨 에러? :${snapshot.error}");
          return const Center(child: Text('로드 중 에러가 발생했습니다.'));
        } else {
          // 비디오 플레이어 표시
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              constraints: const BoxConstraints(
                maxHeight: 300, // 최대 높이 설정
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: VideoPlayer(_controller),
              ),
            ),
          );
        }
      },
    );
  }
}
