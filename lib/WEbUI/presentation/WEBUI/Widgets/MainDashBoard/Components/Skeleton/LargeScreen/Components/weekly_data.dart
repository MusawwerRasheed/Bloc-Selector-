import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';

class WeeklyData extends StatelessWidget {
  const WeeklyData({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
 
     return Container(
      child: Column(
        children: [
          Row(),
          60.y,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                CustomBarChart(
                  data: [60, 40, 30, 90, 80, 30, 90, 40, 90],
                  barWidth: 10,
                  barHeight: 200,
                  spacing: screenWidth*0.030,
                  numberSpacing: 20,
                  bottomSpacing: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      width: screenWidth * 0.38,
      height: screenHeight * 0.37,
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
      color: Colors.white,
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
                (index) => Text('${data[index]}'), 
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
      List<Color> colors = [
        AppColors.lightGrey,
        AppColors.lightBlue,
        AppColors.darkBlue
      ];
      double sectionHeight = barHeight / 3;
      for (int j = 0; j < 3; j++) {
        paint.color = colors[j];
        if (j == 0) {
          canvas.drawRRect(
            RRect.fromRectAndCorners(
              Rect.fromLTWH(startX, startY, barWidth, sectionHeight),
              topLeft: const Radius.circular(10),
              topRight: const Radius.circular(10),
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
