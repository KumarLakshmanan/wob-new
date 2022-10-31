import 'package:flutter/material.dart';

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.orangeAccent, Colors.yellow],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(size.width / 3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height - size.height / 3);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

//Copy this CustomPainter code to the Bottom of the File
class BottomBarCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6713333, size.height * 1.020548);
    path_0.lineTo(size.width * 1.002667, size.height * 1.020548);
    path_0.cubicTo(
        size.width * 1.002667,
        size.height * 1.020548,
        size.width * 0.7665333,
        size.height * 1.143262,
        size.width * 0.6713333,
        size.height * 1.020548);
    path_0.lineTo(size.width * 0.3286667, size.height * 1.020548);
    path_0.cubicTo(
        size.width * 0.2334661,
        size.height * 1.143262,
        size.width * -0.002666667,
        size.height * 1.020548,
        size.width * -0.002666667,
        size.height * 1.020548);
    path_0.lineTo(size.width * 0.3286667, size.height * 1.020548);
    path_0.cubicTo(size.width * 0.4391467, size.height * 0.8781397,
        size.width * 0.4106667, 0, size.width * 0.5000000, 0);
    path_0.cubicTo(
        size.width * 0.5893333,
        0,
        size.width * 0.5608533,
        size.height * 0.8781397,
        size.width * 0.6713333,
        size.height * 1.020548);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff030D10).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
