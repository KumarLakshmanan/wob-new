import 'package:flutter/material.dart';

class RadiusCliper extends CustomClipper<Path> {
  final double heightFactor;

  RadiusCliper({this.heightFactor = 90.0});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - heightFactor);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - heightFactor,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}