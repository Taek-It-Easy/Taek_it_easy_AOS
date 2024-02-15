import 'package:flutter/material.dart';

class PracticeMenuWidget3 extends StatelessWidget {
  const PracticeMenuWidget3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => const TestPoomsae()),
        // );
      },
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 85),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF111111)),
                borderRadius: BorderRadius.circular(50),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  constraints: const BoxConstraints(minHeight: 65),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 5),
                  decoration: const ShapeDecoration(
                      color: Color(0xFF82A8DD), shape: CircleBorder()),
                  child: Image.asset(
                    "assets/images/poomtest.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: const Text(
                    'Test Poomsae',
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
