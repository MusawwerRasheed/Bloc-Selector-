import 'dart:developer';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';

class DailyTraffic extends StatelessWidget {
  DailyTraffic({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  final List<ChartData> data = [
    ChartData(day: 1, traffic: 50),
    ChartData(day: 2, traffic: 70),
    ChartData(day: 3, traffic: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.185,
      height: screenHeight * 0.37,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                customText: AppStrings.dailyTraffic,
                textStyle: Styles.plusJakartaSans(context,
                    color: AppColors.grey,
                    fontSize: screenWidth * 0.007,
                    fontWeight: FontWeight.w200),
              ),
              CustomText(
                customText: '+ 2.3234%',
                textStyle: Styles.plusJakartaSans(context,
                    fontSize: screenWidth * 0.004, color: AppColors.Green),
              ),
            ],
          ),
          CustomText(
            customText: '2.579',
            textStyle: Styles.plusJakartaSans(context,
                fontSize: 18, fontWeight: FontWeight.bold),

          ),

          SizedBox(height: 4), // Add some space between text and chart

          SizedBox(height: 8), // Add some space between text and chart
          Expanded(
            child: Container(
              // You can adjust width and height of the chart container here
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                  barTouchData: BarTouchData(enabled: false),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                    rightTitles: AxisTitles(),
                  ),
                  borderData: FlBorderData(show: false), // Hide chart border
                  barGroups: data
                      .asMap()
                      .map((index, value) => MapEntry(
                          index,
                          BarChartGroupData(x: index, barRods: [
                            BarChartRodData(
                              color: AppColors.darkBlue,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                              toY: value.traffic,
                            ),
                          ])))
                      .values
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final int day;
  final double traffic;

  ChartData({required this.day, required this.traffic});
}
