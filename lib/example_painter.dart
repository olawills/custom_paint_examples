import 'dart:math' as Math;

import 'package:flutter/material.dart';

class ExamplePainter extends StatefulWidget {
  const ExamplePainter({super.key});

  @override
  State<ExamplePainter> createState() => _ExamplePainterState();
}

class _ExamplePainterState extends State<ExamplePainter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              // color: Colors.black,
              child: CustomPaint(
                painter: EmojiPainter(),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Happy Sunday, Try go Church',
                style: TextStyle(fontSize: 16))
          ],
        ),
      ),
    );
  }
}

class ExmpleCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    var linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10;

    var pathPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10;

    var path = Path();

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width * 0.5, size.height / 2), linePaint);
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class CarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10;

    var tireRim = 50.0;
    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(size.width * 0.2 + tireRim / 2, tireRim / 2,
        size.width * 0.2 + tireRim, size.height);
    path.lineTo(size.width * 0.2 + tireRim + 50, size.height);
    path.quadraticBezierTo(size.width * 0.2 + tireRim / 2, tireRim / 2,
        size.width * 0.2 + tireRim, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class EmojiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xffFFFF00)
      ..strokeWidth = 10;
    var smileyPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10;

    var smileLine = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    var path = Path();

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.4),
        size.width * 0.1, smileyPaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.4),
        size.width * 0.1, smileyPaint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 1.8),
            radius: (size.width / 2) / 1.8),
        0,
        Math.pi,
        false,
        smileLine);
    // path.moveTo(size.width * 0.65, 0);
    // path.lineTo(size.width / 2, size.height / 2);
    // path.lineTo(size.width / 2, 0);
    // canvas.drawPath(path, smileLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
