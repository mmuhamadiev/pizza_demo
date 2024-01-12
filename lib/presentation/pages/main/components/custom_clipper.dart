import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;
    path.lineTo(0, h - 50);
    path.quadraticBezierTo(w * 0.5, h + 50, w, h - 50);
    path.lineTo(w, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}