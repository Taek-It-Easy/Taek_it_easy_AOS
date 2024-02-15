import 'package:flutter/material.dart';

class TextSubTitleWidget extends StatelessWidget {
  const TextSubTitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
