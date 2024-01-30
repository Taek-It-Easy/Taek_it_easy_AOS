import 'package:flutter/material.dart';

class AttendBox extends StatelessWidget {
  final String dayName;
  final bool attendStatus;

  const AttendBox(
      {super.key, required this.dayName, required this.attendStatus});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 2.5, right: 2.5),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: attendStatus ? Colors.transparent : const Color(0xFFD6D6D6),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (attendStatus)
                Image.asset(
                  "assets/images/attend.png",
                  width: 60.0,
                  height: 60.0,
                ),
              Text(
                dayName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
