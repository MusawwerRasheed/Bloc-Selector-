import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/WEbUI/Data/Resources/color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CheckTable extends StatelessWidget {
  const CheckTable({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.38,
      height: screenHeight * 0.37,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  'check table',
                  style: TextStyle(
                    fontSize: screenWidth * 0.014,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(
                  right: 10,
                  top: 20,
                ),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.darkBlue,
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: screenWidth * 0.25,
                    height: screenHeight * 0.20,
                    child: SfCartesianChart(
                      primaryXAxis: const CategoryAxis(
                        majorTickLines: MajorTickLines(size: 0),
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      primaryYAxis: const NumericAxis(
                        isVisible: false,
                        majorGridLines: MajorGridLines(width: 0),
                      ),
                      plotAreaBorderWidth: 0,
                      series: <CartesianSeries>[
                        SplineSeries<Map<String, dynamic>, String>(
                          color: AppColors.darkBlue,
                          dataSource: <Map<String, dynamic>>[
                            {'month': 'Jan', 'value1': 1700, 'value2': 1300},
                            {'month': 'Feb', 'value1': 900, 'value2': 120},
                            {'month': 'Mar', 'value1': 1500, 'value2': 1190},
                            {'month': 'Apr', 'value1': 800, 'value2': 140},
                            {'month': 'May', 'value1': 1600, 'value2': 1120},
                            {'month': 'June', 'value1': 900, 'value2': 190},
                          ],
                          xValueMapper: (Map<String, dynamic> sales, _) =>
                              sales['month']!,
                          yValueMapper: (Map<String, dynamic> sales, _) =>
                              sales['value2'],
                          name: 'Data Line 2',
                          markerSettings: MarkerSettings(isVisible: true),
                        ),
                        SplineSeries<Map<String, dynamic>, String>(
                          color: AppColors.lightBlue,
                          dataSource: const <Map<String, dynamic>>[
                            {'month': 'Jan', 'value1': 1700, 'value2': 1300},
                            {'month': 'Feb', 'value1': 900, 'value2': 120},
                            {'month': 'Mar', 'value1': 1500, 'value2': 1190},
                            {'month': 'Apr', 'value1': 800, 'value2': 140},
                            {'month': 'May', 'value1': 1600, 'value2': 1120},
                            {'month': 'June', 'value1': 900, 'value2': 190},
                          ],
                          xValueMapper: (Map<String, dynamic> sales, _) =>
                              sales['month']!,
                          yValueMapper: (Map<String, dynamic> sales, _) =>
                              sales['value1'],
                          name: 'Data Line 1',
                          markerSettings: MarkerSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
