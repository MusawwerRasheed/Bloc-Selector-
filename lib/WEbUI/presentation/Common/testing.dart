import 'package:flutter/material.dart';
 


class MyAppNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomBarChart(
            data: [60, 40, 60, 30, 50, 80, 60, 40, 20],
            barWidth: 10.0,
            barHeight: 200.0,
            spacing: 30.0,
            numberSpacing: 20.0,
            bottomSpacing: 20.0,
          ),
        ),
      ),
    );
  }
}

 


 class CustomBarChart extends StatelessWidget {
  final List<double> data;
  final double barWidth;
  final double barHeight;
  final double spacing;
  final double numberSpacing;
  final double bottomSpacing;

  CustomBarChart({
    required this.data,
    required this.barWidth,
    required this.barHeight,
    this.spacing = 10.0,
    this.numberSpacing = 20.0,
    this.bottomSpacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: data.length * barWidth + (data.length - 1) * spacing,
      height: 130,
      child: Stack(
        children: [
          Positioned(
            bottom: 45,
            child: CustomPaint(
              painter: BarChartPainter(data, barWidth, barHeight, spacing),
            ),
          ),
          Positioned(
            bottom: bottomSpacing,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                data.length,
                (index) => Text('${data[index]}'), // Display data values
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class BarChartPainter extends CustomPainter {
  final List<double> data;
  final double barWidth;
  final double barHeight;
  final double spacing;

  BarChartPainter(this.data, this.barWidth, this.barHeight, this.spacing);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    double startX = 0.0;
    for (int i = 0; i < data.length; i++) {
      double barHeight = data[i];
      double startY = size.height - barHeight;
      List<Color> colors = [Colors.grey, Colors.blue, Colors.purple];
      double sectionHeight = barHeight / 3;
      for (int j = 0; j < 3; j++) {
        paint.color = colors[j];
        if (j == 0) {
          canvas.drawRRect(
            RRect.fromRectAndCorners(
              Rect.fromLTWH(startX, startY, barWidth, sectionHeight),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            paint,
          );
        } else {
          Rect rect = Rect.fromLTWH(
              startX, startY + j * sectionHeight, barWidth, sectionHeight);
          canvas.drawRect(rect, paint);
        }
      }
      startX += barWidth + spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
