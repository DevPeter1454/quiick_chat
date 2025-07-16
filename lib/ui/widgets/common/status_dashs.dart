import 'package:flutter/material.dart';

class StatusDashs extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double circumference = 3.141592653589793 * (2 * radius);
    final double dashLength = circumference / 2; // Length of each dash
    final double gapLength =
        circumference / (dashLength * dashLength); // Gap between dashes

    // 3.141592653589793 * radius;
    double startAngle = 3.141592653589793 / 2;
    // while (startAngle < 2 * 3.141592653589793) {
    //   print(startAngle);
    //   final double sweepAngle = 3.141592653589793;
    //   canvas.drawArc(
    //     Rect.fromCircle(
    //         center: Offset(size.width / 2, size.height / 2), radius: radius),
    //     startAngle,
    //     sweepAngle,
    //     false,
    //     paint,
    //   );
    //   startAngle += sweepAngle + (gapLength);
    // }
    while (startAngle < 2 * 3.141592653589793) {
      print(startAngle);
      const double sweepAngle = 3.141592653589793;
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += 4;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
