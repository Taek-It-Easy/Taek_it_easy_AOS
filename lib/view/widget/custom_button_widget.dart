import 'package:flutter/material.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
          maxHeight:
              MediaQuery.of(context).size.height * 0.11, // 최대 너비를 화면 폭의 80%로 제한
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Fonts.buttonText,
              ),
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
