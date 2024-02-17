// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/data/practice_status.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';
import 'package:taek_it_easy/provider/main_provider.dart';

import '../widget/chapter_box_widget.dart';

class MenuDialog extends StatelessWidget {
  final String title;
  const MenuDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);

    return Dialog(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Color(0xFF8DB9A6)),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Fonts.dialogTitle,
                ),
              ),
            )
          ],
        ),
        Container(
            constraints:
                const BoxConstraints(maxHeight: 300.0, minHeight: 250.0),
            child: SingleChildScrollView(child: Consumer<MainProvider>(
              builder: (context, provier, _) {
                final clearStatus = provider.clearStatus;
                return Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  for (int i = 0; i < clearStatus.length; i += 3)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int j = i;
                                j < i + 3 && j < clearStatus.length;
                                j++)
                              ChapterBox(num: (j), clearStatus: clearStatus[j]),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                ]);
              },
            ))),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Color(0xFF111111)),
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
      ]),
    );
  }
}

Color getColorForStatus(PracticeStatus status) {
  switch (status) {
    case PracticeStatus.complete:
      return const Color(0xFF8DB9A6);
    case PracticeStatus.inProgress:
      return const Color(0xFF436355);
    case PracticeStatus.incomplete:
      return Colors.white;
    default:
      return Colors.white;
  }
}

TextStyle getFontForStatus(PracticeStatus status) {
  switch (status) {
    case PracticeStatus.complete:
      return Fonts.chapterClear;
    case PracticeStatus.inProgress:
      return Fonts.chapterClear;
    case PracticeStatus.incomplete:
      return Fonts.chapterNoneClear;
    default:
      return Fonts.chapterNoneClear;
  }
}
