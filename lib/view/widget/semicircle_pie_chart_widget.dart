import 'package:flutter/material.dart';

class SemicirclePieChart extends StatelessWidget {
  final List<double> values;
  final List<Color> colors;
  final int point;
  final String comment;

  const SemicirclePieChart(
      {super.key,
      required this.values,
      required this.colors,
      required this.point,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Adjust the height as needed
      child: AspectRatio(
        aspectRatio: 1.3,
        child: CustomPaint(
          painter: SemicirclePieChartPainter(
              values: values, colors: colors, point: point, comment: comment),
        ),
      ),
    );
  }
}

class SemicirclePieChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final int point;
  final String comment;
  static const gapFactor = 5; // Adjust the gap factor as needed
  static const borderWidth = 1.0; // Adjust the border width as needed

  SemicirclePieChartPainter(
      {required this.values,
      required this.colors,
      required this.point,
      required this.comment});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height;
    final radius = size.height;
    final holeRadius = radius / 2; // Adjust the hole size as needed
    final total = values.reduce((value, element) => value + element);

    double startRadian = 0; // Start from the bottom
    for (int i = values.length - 1; i >= 0; i--) {
      final sweepRadian = (values[i] / total) * 170 * (3.14 / 180);
      const gapRadian = gapFactor * (3.14 / 180); // Convert to radians
      final paint = Paint()..color = colors[i];
      final borderPaint = Paint()
        ..color = Colors.black // Adjust the border color as needed
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startRadian,
        -sweepRadian, // Make it negative to flip the direction
        true,
        paint,
      );

      // Draw border
      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startRadian,
        -sweepRadian, // Make it negative to flip the direction
        true,
        borderPaint,
      );

      startRadian += -(sweepRadian + gapRadian); // Introduce a small gap
    }

    // Draw a circle to create a hole in the center
    final holePaint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.white, Colors.white], // 원하는 색상으로 수정
        begin: Alignment.topCenter,
        end: Alignment.center,
      ).createShader(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius))
      ..style = PaintingStyle.fill; // Adjust color as needed
    canvas.drawCircle(Offset(centerX, centerY), holeRadius, holePaint);

    final textPainter1 = TextPainter(
      text: TextSpan(
          text: comment,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
      textDirection: TextDirection.ltr,
    );

    final textPainter2 = TextPainter(
      text: TextSpan(
          text: point.toString(),
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black)),
      textDirection: TextDirection.ltr,
    );

    textPainter1.layout(minWidth: 0, maxWidth: size.width);
    textPainter2.layout(minWidth: 0, maxWidth: size.width);

    textPainter1.paint(
        canvas,
        Offset(centerX - textPainter1.width / 2,
            centerY - textPainter1.height / 2 - 50));
    textPainter2.paint(
        canvas,
        Offset(centerX - textPainter2.width / 2,
            centerY + textPainter2.height / 2 - 70));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
