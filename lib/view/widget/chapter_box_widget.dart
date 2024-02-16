// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:taek_it_easy/data/practice_status.dart';
import 'package:taek_it_easy/view/dialog/menu_dialog.dart';
import 'package:taek_it_easy/view/page/practice_page.dart';

class ChapterBox extends StatelessWidget {
  final String num;
  final PracticeStatus clearStatus;

  const ChapterBox({super.key, required this.num, required this.clearStatus});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        print("chapter $num : $clearStatus");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PracticePage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            shape: BoxShape.circle,
            color: getColorForStatus(clearStatus)),
        child: Center(
            child: Text(
          num,
          style: getFontForStatus(clearStatus),
        )),
      ),
    ));
  }
}
