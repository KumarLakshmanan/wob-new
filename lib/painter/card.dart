import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2222222, size.height * 0.1000000);
    path0.quadraticBezierTo(size.width * 0.2244444, size.height * 0.1940000,
        size.width * 0.2222222, size.height * 0.2500000);
    path0.cubicTo(
        size.width * 0.2777778,
        size.height * 0.2510000,
        size.width * 0.2777778,
        size.height * 0.4460000,
        size.width * 0.2222222,
        size.height * 0.4500000);
    path0.quadraticBezierTo(size.width * 0.2222222, size.height * 0.4875000,
        size.width * 0.2222222, size.height * 0.6000000);
    path0.lineTo(size.width * 0.6111111, size.height * 0.6000000);
    path0.quadraticBezierTo(size.width * 0.6111111, size.height * 0.4725000,
        size.width * 0.6111111, size.height * 0.4500000);
    path0.cubicTo(
        size.width * 0.5544444,
        size.height * 0.4490000,
        size.width * 0.5577778,
        size.height * 0.2500000,
        size.width * 0.6111111,
        size.height * 0.2500000);
    path0.quadraticBezierTo(size.width * 0.6111111, size.height * 0.2125000,
        size.width * 0.6111111, size.height * 0.1000000);
    path0.lineTo(size.width * 0.2222222, size.height * 0.1000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
