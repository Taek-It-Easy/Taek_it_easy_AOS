import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  const TextTitleWidget(
      {super.key, required this.title1, required this.title2});
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: title1,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(1, 4),
                  )
                ]),
          ),
          TextSpan(
            text: title2,
            style: const TextStyle(
                color: Color(0xFF436254),
                fontSize: 35,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(1, 4),
                  )
                ]),
          ),
        ]),
      ),
    );
  }
}
