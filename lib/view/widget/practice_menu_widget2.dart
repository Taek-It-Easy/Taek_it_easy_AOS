import 'package:flutter/material.dart';
import 'package:taek_it_easy/designSystem/font_system.dart';

class PracticeMenuWidget2 extends StatelessWidget {
  const PracticeMenuWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return Consumer<PracticeProvider>(
        //         builder: (context, PracticeProvider viewModel, _) {
        //       return CustomDialog(
        //           title: viewModel.basicTitle,
        //           clearStatus: viewModel.basicClearStatus);
        //     });
        //   },
        // );
      },

      //품새연습
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
                      color: Color(0xFF8DB9A5), shape: CircleBorder()),
                  child: Image.asset(
                    "assets/images/poomsae.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: const Text('Practice Poomsae',
                      style: Fonts.mainMenuTitle),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 70),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF111111)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: const Text('Jang 1',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
