import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  Paint _paint;
  double _vertexPosition;

  TrianglePainter({Color color = Colors.white, double vertexPosition = 0.5}) {
    _vertexPosition = vertexPosition;
    _paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path
      ..moveTo(size.width * _vertexPosition, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();

    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
