import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taek_it_easy/view/screens/main_page.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final List<bool> clearStatus;

  const CustomDialog(
      {super.key, required this.title, required this.clearStatus});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // 다이얼로그 닫기
      },
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    color: const Color(0xFF8DB9A6),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Chapterbox(chnumber: "1", clearstatus: clearStatus[0]),
                Chapterbox(chnumber: "2", clearstatus: clearStatus[1]),
                Chapterbox(chnumber: "3", clearstatus: clearStatus[2]),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Chapterbox(chnumber: "4", clearstatus: clearStatus[3]),
                Chapterbox(chnumber: "5", clearstatus: clearStatus[4]),
                Chapterbox(chnumber: "6", clearstatus: clearStatus[5]),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Chapterbox(chnumber: "7", clearstatus: clearStatus[6]),
                Chapterbox(chnumber: "8", clearstatus: clearStatus[7]),
                Chapterbox(chnumber: "9", clearstatus: clearStatus[8]),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: const Color(0xFF111111),
                child: const Center(
                  child: Text(
                    'Quit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chapterbox extends StatelessWidget {
  final String chnumber;
  final bool clearstatus;

  const Chapterbox({
    super.key,
    required this.chnumber,
    required this.clearstatus,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (clearstatus) {
            // 특정 페이지로 이동하거나 다른 작업 수행
            /*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PracticeBasic()),
            );
            */
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 2.5, right: 2.5),
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            shape: BoxShape.circle,
            color: clearstatus ? const Color(0xFF8DB9A6) : Colors.white,
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (clearstatus)
                  Text(
                    chnumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),
                  )
                else
                  Text(
                    chnumber,
                    style: const TextStyle(
                      color: Color(0xFF868686),
                      fontSize: 60,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 10,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
