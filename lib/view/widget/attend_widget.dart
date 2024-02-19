// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';

class AttendSection extends StatelessWidget {
  const AttendSection(
      {super.key, required this.dayName, required this.attendStatus});

  final List<String> dayName;
  final List<bool?> attendStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 130, left: 16, right: 16),
      padding: const EdgeInsets.all(5),
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.white, // 테두리 색상
            width: 2.0, // 테두리 두께
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 4,
              offset: Offset(3, 3),
              spreadRadius: 1,
            )
          ]),
      child: Row(
        children: [
          for (int i = 0; i < dayName.length; i++)
            AttendBox(
              dayName: dayName[i],
              attendStatus: attendStatus[i],
            )
        ],
      ),
    );
  }
}

class AttendBox extends StatelessWidget {
  final String dayName;
  final bool? attendStatus;

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
          color: attendStatus == true
              ? Colors.transparent
              : const Color(0xFFD6D6D6),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (attendStatus == true)
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
