// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taek_it_easy/data/practice_status.dart';
import 'package:taek_it_easy/provider/main_provider.dart';
import 'package:taek_it_easy/view/dialog/menu_dialog.dart';
import 'package:taek_it_easy/view/page/practice_page.dart';

class ChapterBox extends StatelessWidget {
  final int num;
  final PracticeStatus clearStatus;

  const ChapterBox({super.key, required this.num, required this.clearStatus});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context, listen: false);

    return Expanded(
        child: InkWell(
      onTap: () {
        provider.setVideoUrl(num + 1).then((value) {
          provider.startDetect();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PracticePage(uri: value.uri, title: value.title)));
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.5),
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            shape: BoxShape.circle,
            color: getColorForStatus(clearStatus)),
        child: Center(
            child: Text(
          (num + 1).toString(),
          style: getFontForStatus(clearStatus),
        )),
      ),
    ));
  }
}
