import 'package:flutter/material.dart';
import 'package:taek_it_easy/view/screens/practice_page.dart';

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
            Column(
              children: [
                for (int i = 0; i < 9; i += 3)
                  Column(
                    children: [
                      Row(
                        children: [
                          for (int j = i; j < i + 3; j++)
                            Chapterbox(
                                chnumber: "${j + 1}",
                                clearstatus: clearStatus[j]),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                const SizedBox(height: 30),
              ],
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PracticePage()),
            );
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
