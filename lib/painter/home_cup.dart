import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class HomeCupPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff3E3236).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3556338, size.height * 0.09687500),
        size.width * 0.01056338, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff3E3236).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8556338, size.height * 0.2031250),
        size.width * 0.01056338, paint_1_fill);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff251F21).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.8345070, size.height * 0.8968750),
        size.width * 0.01056338, paint_2_fill);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffFDDD00).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.7535211, size.height * 0.5500000),
        size.width * 0.02816901, paint_3_fill);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffA35B43).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3345070, size.height * 0.6843750),
        size.width * 0.01056338, paint_4_fill);

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xff00E0A2).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.2077465, size.height * 0.9031250),
        size.width * 0.01760563, paint_5_fill);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint_6_stroke.color = Color(0xff5A5A5A).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4471831, size.height * 0.7468750,
                size.width * 0.1901408, size.height * 0.1687500),
            bottomRight: Radius.circular(size.width * 0.09507042),
            bottomLeft: Radius.circular(size.width * 0.09507042),
            topLeft: Radius.circular(size.width * 0.09507042),
            topRight: Radius.circular(size.width * 0.09507042)),
        paint_6_stroke);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.4471831, size.height * 0.7468750,
                size.width * 0.1901408, size.height * 0.1687500),
            bottomRight: Radius.circular(size.width * 0.09507042),
            bottomLeft: Radius.circular(size.width * 0.09507042),
            topLeft: Radius.circular(size.width * 0.09507042),
            topRight: Radius.circular(size.width * 0.09507042)),
        paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(size.width * 0.5211268, size.height * 0.1000000);
    path_7.cubicTo(size.width * 0.5211268, size.height * 0.02500000,
        size.width * 0.4647887, 0, size.width * 0.4084507, 0);
    path_7.lineTo(size.width * 0.6971831, 0);
    path_7.cubicTo(
        size.width * 0.6373239,
        0,
        size.width * 0.5809859,
        size.height * 0.02187500,
        size.width * 0.5809859,
        size.height * 0.1000000);
    path_7.lineTo(size.width * 0.5809859, size.height * 0.9500000);
    path_7.lineTo(size.width * 0.5211268, size.height * 0.9500000);
    path_7.lineTo(size.width * 0.5211268, size.height * 0.1000000);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5633803, 0),
        Offset(size.width * 0.5633803, size.height * 0.3062500),
        [Colors.white.withOpacity(1), Color(0xffFBCE59).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_7, paint_7_fill);

    Path path_8 = Path();
    path_8.moveTo(size.width * 0.7051408, size.height * 0.6552062);
    path_8.cubicTo(
        size.width * 0.6990986,
        size.height * 0.6547688,
        size.width * 0.6917394,
        size.height * 0.6546312,
        size.width * 0.6819218,
        size.height * 0.6545937);
    path_8.cubicTo(
        size.width * 0.6766683,
        size.height * 0.6445688,
        size.width * 0.6714141,
        size.height * 0.6235863,
        size.width * 0.6687873,
        size.height * 0.6091262);
    path_8.cubicTo(
        size.width * 0.6691254,
        size.height * 0.6091262,
        size.width * 0.6694634,
        size.height * 0.6091262,
        size.width * 0.6697993,
        size.height * 0.6091262);
    path_8.cubicTo(
        size.width * 0.6853246,
        size.height * 0.6091256,
        size.width * 0.6985007,
        size.height * 0.6091256,
        size.width * 0.7093099,
        size.height * 0.6099094);
    path_8.cubicTo(
        size.width * 0.7206549,
        size.height * 0.6107319,
        size.width * 0.7316197,
        size.height * 0.6125294,
        size.width * 0.7420915,
        size.height * 0.6172637);
    path_8.cubicTo(
        size.width * 0.7579225,
        size.height * 0.6244219,
        size.width * 0.7707958,
        size.height * 0.6358438,
        size.width * 0.7788592,
        size.height * 0.6498938);
    path_8.cubicTo(
        size.width * 0.7841901,
        size.height * 0.6591875,
        size.width * 0.7862183,
        size.height * 0.6689250,
        size.width * 0.7871479,
        size.height * 0.6789875);
    path_8.cubicTo(
        size.width * 0.7880282,
        size.height * 0.6885813,
        size.width * 0.7880282,
        size.height * 0.7002750,
        size.width * 0.7880282,
        size.height * 0.7140500);
    path_8.lineTo(size.width * 0.7880282, size.height * 0.7184500);
    path_8.cubicTo(
        size.width * 0.7880282,
        size.height * 0.7322250,
        size.width * 0.7880282,
        size.height * 0.7439187,
        size.width * 0.7871479,
        size.height * 0.7535125);
    path_8.cubicTo(
        size.width * 0.7862183,
        size.height * 0.7635812,
        size.width * 0.7841901,
        size.height * 0.7733187,
        size.width * 0.7788592,
        size.height * 0.7826062);
    path_8.cubicTo(
        size.width * 0.7707958,
        size.height * 0.7966563,
        size.width * 0.7579225,
        size.height * 0.8080813,
        size.width * 0.7420915,
        size.height * 0.8152375);
    path_8.cubicTo(
        size.width * 0.7316197,
        size.height * 0.8199687,
        size.width * 0.7206549,
        size.height * 0.8217688,
        size.width * 0.7093099,
        size.height * 0.8225938);
    path_8.cubicTo(
        size.width * 0.7021056,
        size.height * 0.8231125,
        size.width * 0.6938500,
        size.height * 0.8232875,
        size.width * 0.6845486,
        size.height * 0.8233438);
    path_8.cubicTo(
        size.width * 0.6871754,
        size.height * 0.8100938,
        size.width * 0.6898021,
        size.height * 0.7961063,
        size.width * 0.6898021,
        size.height * 0.7778437);
    path_8.cubicTo(
        size.width * 0.6958599,
        size.height * 0.7777688,
        size.width * 0.7008345,
        size.height * 0.7776063,
        size.width * 0.7051408,
        size.height * 0.7772938);
    path_8.cubicTo(
        size.width * 0.7133169,
        size.height * 0.7767000,
        size.width * 0.7167958,
        size.height * 0.7756688,
        size.width * 0.7188451,
        size.height * 0.7747438);
    path_8.cubicTo(
        size.width * 0.7250423,
        size.height * 0.7719437,
        size.width * 0.7300775,
        size.height * 0.7674750,
        size.width * 0.7332324,
        size.height * 0.7619750);
    path_8.cubicTo(
        size.width * 0.7342746,
        size.height * 0.7601562,
        size.width * 0.7354366,
        size.height * 0.7570687,
        size.width * 0.7361056,
        size.height * 0.7498125);
    path_8.cubicTo(
        size.width * 0.7368028,
        size.height * 0.7422937,
        size.width * 0.7368169,
        size.height * 0.7324688,
        size.width * 0.7368169,
        size.height * 0.7175500);
    path_8.lineTo(size.width * 0.7368169, size.height * 0.7149500);
    path_8.cubicTo(
        size.width * 0.7368169,
        size.height * 0.7000312,
        size.width * 0.7368028,
        size.height * 0.6902125,
        size.width * 0.7361056,
        size.height * 0.6826875);
    path_8.cubicTo(
        size.width * 0.7354366,
        size.height * 0.6754313,
        size.width * 0.7342746,
        size.height * 0.6723438,
        size.width * 0.7332324,
        size.height * 0.6705250);
    path_8.cubicTo(
        size.width * 0.7300775,
        size.height * 0.6650250,
        size.width * 0.7250423,
        size.height * 0.6605562,
        size.width * 0.7188451,
        size.height * 0.6577563);
    path_8.cubicTo(
        size.width * 0.7167958,
        size.height * 0.6568312,
        size.width * 0.7133169,
        size.height * 0.6558000,
        size.width * 0.7051408,
        size.height * 0.6552062);
    path_8.close();

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Color(0xffE8DFFF).withOpacity(1.0);
    canvas.drawPath(path_8, paint_8_fill);

    Path path_9 = Path();
    path_9.moveTo(size.width * 0.3231725, size.height * 0.5625000);
    path_9.lineTo(size.width * 0.6793472, size.height * 0.5625000);
    path_9.lineTo(size.width * 0.6936028, size.height * 0.8332437);
    path_9.cubicTo(
        size.width * 0.6965908,
        size.height * 0.8900000,
        size.width * 0.6980845,
        size.height * 0.9183750,
        size.width * 0.6865669,
        size.height * 0.9401687);
    path_9.cubicTo(
        size.width * 0.6764423,
        size.height * 0.9593250,
        size.width * 0.6595535,
        size.height * 0.9750313,
        size.width * 0.6384627,
        size.height * 0.9849000);
    path_9.cubicTo(
        size.width * 0.6144697,
        size.height * 0.9961313,
        size.width * 0.5824620,
        size.height * 0.9961313,
        size.width * 0.5184465,
        size.height * 0.9961313);
    path_9.lineTo(size.width * 0.4812303, size.height * 0.9961313);
    path_9.cubicTo(
        size.width * 0.4166754,
        size.height * 0.9961313,
        size.width * 0.3843979,
        size.height * 0.9961313,
        size.width * 0.3602965,
        size.height * 0.9847750);
    path_9.cubicTo(
        size.width * 0.3391134,
        size.height * 0.9747938,
        size.width * 0.3222035,
        size.height * 0.9589250,
        size.width * 0.3121620,
        size.height * 0.9395938);
    path_9.cubicTo(
        size.width * 0.3007366,
        size.height * 0.9176000,
        size.width * 0.3025437,
        size.height * 0.8890000,
        size.width * 0.3061577,
        size.height * 0.8318000);
    path_9.lineTo(size.width * 0.3231725, size.height * 0.5625000);
    path_9.close();

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Color(0xffE8DFFF).withOpacity(1.0);
    canvas.drawPath(path_9, paint_9_fill);

    Path path_10 = Path();
    path_10.moveTo(size.width * 0.3494444, size.height * 0.5625000);
    path_10.lineTo(size.width * 0.6530810, size.height * 0.5625000);
    path_10.lineTo(size.width * 0.6650197, size.height * 0.8411750);
    path_10.cubicTo(
        size.width * 0.6669859,
        size.height * 0.8870812,
        size.width * 0.6679690,
        size.height * 0.9100375,
        size.width * 0.6585141,
        size.height * 0.9276437);
    path_10.cubicTo(
        size.width * 0.6502021,
        size.height * 0.9431313,
        size.width * 0.6364549,
        size.height * 0.9558000,
        size.width * 0.6193373,
        size.height * 0.9637625);
    path_10.cubicTo(
        size.width * 0.5998662,
        size.height * 0.9728188,
        size.width * 0.5739845,
        size.height * 0.9728188,
        size.width * 0.5222204,
        size.height * 0.9728188);
    path_10.lineTo(size.width * 0.4772099, size.height * 0.9728188);
    path_10.cubicTo(
        size.width * 0.4249845,
        size.height * 0.9728188,
        size.width * 0.3988718,
        size.height * 0.9728188,
        size.width * 0.3793077,
        size.height * 0.9636562);
    path_10.cubicTo(
        size.width * 0.3621099,
        size.height * 0.9556000,
        size.width * 0.3483437,
        size.height * 0.9427813,
        size.width * 0.3401014,
        size.height * 0.9271500);
    path_10.cubicTo(
        size.width * 0.3307239,
        size.height * 0.9093687,
        size.width * 0.3319732,
        size.height * 0.8862187,
        size.width * 0.3344718,
        size.height * 0.8399250);
    path_10.lineTo(size.width * 0.3494444, size.height * 0.5625000);
    path_10.close();

    Paint paint_10_fill = Paint()..style = PaintingStyle.fill;
    paint_10_fill.color = Color(0xffFBCE59).withOpacity(1.0);
    canvas.drawPath(path_10, paint_10_fill);

    Paint paint_11_fill = Paint()..style = PaintingStyle.fill;
    paint_11_fill.color = Color(0xffFBCE59).withOpacity(1.0);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.3309859, size.height * 0.7461313,
            size.width * 0.3450704, size.height * 0.4687500),
        paint_11_fill);

    Path path_12 = Path();
    path_12.moveTo(size.width * 0.4906197, size.height * 0.9728188);
    path_12.lineTo(size.width * 0.5222155, size.height * 0.9728188);
    path_12.cubicTo(
        size.width * 0.5739796,
        size.height * 0.9728188,
        size.width * 0.5998613,
        size.height * 0.9728188,
        size.width * 0.6193324,
        size.height * 0.9637625);
    path_12.cubicTo(
        size.width * 0.6364500,
        size.height * 0.9558000,
        size.width * 0.6501972,
        size.height * 0.9431313,
        size.width * 0.6585092,
        size.height * 0.9276437);
    path_12.cubicTo(
        size.width * 0.6679641,
        size.height * 0.9100375,
        size.width * 0.6669810,
        size.height * 0.8870812,
        size.width * 0.6650141,
        size.height * 0.8411750);
    path_12.lineTo(size.width * 0.6609430, size.height * 0.7461313);
    path_12.lineTo(size.width * 0.6031514, size.height * 0.7461313);
    path_12.lineTo(size.width * 0.6082183, size.height * 0.8644063);
    path_12.cubicTo(
        size.width * 0.6098380,
        size.height * 0.9022125,
        size.width * 0.6106479,
        size.height * 0.9211125,
        size.width * 0.6028613,
        size.height * 0.9356188);
    path_12.cubicTo(
        size.width * 0.5960162,
        size.height * 0.9483687,
        size.width * 0.5846951,
        size.height * 0.9588062,
        size.width * 0.5705979,
        size.height * 0.9653625);
    path_12.cubicTo(
        size.width * 0.5545634,
        size.height * 0.9728188,
        size.width * 0.5332486,
        size.height * 0.9728188,
        size.width * 0.4906197,
        size.height * 0.9728188);
    path_12.close();

    Paint paint_12_fill = Paint()..style = PaintingStyle.fill;
    paint_12_fill.color = Color(0xffF1A438).withOpacity(1.0);
    canvas.drawPath(path_12, paint_12_fill);

    Paint paint_13_fill = Paint()..style = PaintingStyle.fill;
    paint_13_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.3838028, size.height * 0.7492562),
        size.width * 0.04577465, paint_13_fill);

    Paint paint_14_fill = Paint()..style = PaintingStyle.fill;
    paint_14_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.6213570, size.height * 0.7538375),
        size.width * 0.04389204, paint_14_fill);

    Paint paint_15_fill = Paint()..style = PaintingStyle.fill;
    paint_15_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.7523813),
        size.width * 0.04929577, paint_15_fill);

    Paint paint_16_fill = Paint()..style = PaintingStyle.fill;
    paint_16_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5633803, size.height * 0.7461313),
        size.width * 0.04929577, paint_16_fill);

    Paint paint_17_fill = Paint()..style = PaintingStyle.fill;
    paint_17_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.4401408, size.height * 0.7617563),
        size.width * 0.05985915, paint_17_fill);

    Path path_18 = Path();
    path_18.moveTo(size.width * 0.4008507, size.height * 0.6745063);
    path_18.lineTo(size.width * 0.3903430, size.height * 0.8796625);

    Paint paint_18_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.04202993;
    paint_18_stroke.color = Colors.white.withOpacity(1.0);
    paint_18_stroke.strokeCap = StrokeCap.round;
    paint_18_stroke.strokeJoin = StrokeJoin.round;
    canvas.drawPath(path_18, paint_18_stroke);

    Paint paint_18_fill = Paint()..style = PaintingStyle.fill;
    paint_18_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_18, paint_18_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
