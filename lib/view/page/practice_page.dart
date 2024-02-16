import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/page/camera_page.dart';
import 'package:taek_it_easy/view/widget/quit_button_widget.dart';
import 'package:taek_it_easy/view/widget/video_button_widget.dart';
import 'package:taek_it_easy/view/widget/video_title_widget.dart';
import 'package:taek_it_easy/view/widget/video_widget.dart';

class PracticePage extends StatelessWidget {
  const PracticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Color(0xFF8DB9A6), Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF8DB9A6), Colors.white],
                    ),
                    border:
                        Border.all(color: const Color(0xFF436355), width: 2),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(1, 4),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child:
                            TextTitleWidget(title1: "TAEGEUK", title2: "basic"),
                      ),
                      VideoWidget(
                          videoUrl:
                              "https://storage.googleapis.com/taek_it_easy_bucket/Taekwondo_1%2C2%2C3%EC%9E%A5_%EA%B8%B0%EB%B3%B8%EB%8F%99%EC%9E%91_%ED%8E%B8%EC%A7%91%EB%B3%B8/%EB%8F%99%EC%98%81%EC%83%81/%ED%83%9C%EA%B7%B91%EC%9E%A5_%EC%A4%80%EB%B9%84%EC%9E%90%EC%84%B8%20-%20Trim.MP4"),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Center(
                          child: Text(
                            "Action 1",
                            style: Fonts.videoSubText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //버튼 Section
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: const Color(0xFF436355), width: 2),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(1, 4),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: VideoButton(
                            label: 'Replay',
                            icon: Icons.replay,
                            color: const Color(0xFFC1C1C1),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: VideoButton(
                            label: 'Next',
                            icon: Icons.east,
                            color: const Color(0xFF8DB9A5),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CameraPage()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(20.0),
          child: QuitButton(),
        ),
      ),
    );
  }
}
