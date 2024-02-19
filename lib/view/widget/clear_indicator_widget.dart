import 'package:flutter/material.dart';

class ClearIndicator extends StatelessWidget {
  final bool isclear;
  final int number;

  const ClearIndicator(
      {super.key, required this.isclear, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isclear ? const Color(0xFF8DB9A6) : Colors.grey.shade400,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
    );
  }
}
