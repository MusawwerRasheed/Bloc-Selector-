import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyPieChart extends StatefulWidget {
  MonthlyPieChart({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  _MonthlyPieChartState createState() => _MonthlyPieChartState();
}

class _MonthlyPieChartState extends State<MonthlyPieChart> {
  final List<ChartData> data = [
    ChartData(day: 1, traffic: 50, label: 'Your Files', color: AppColors.lightGrey),
    ChartData(day: 2, traffic: 70, label: 'System', color: AppColors.darkBlue),
    ChartData(day: 3, traffic: 30, label: 'Other', color: AppColors.lightBlue),
  ];

  // Define the list of month names
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  String? selectedMonth; // Nullable selected month

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.185,
      height: widget.screenHeight * 0.37,
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
              Text(
                'Monthly Pie Chart',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widget.screenWidth * 0.009,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // Dropdown button
              DropdownButton<String>(
                underline: SizedBox(),
                style: TextStyle(
                  fontSize: 9,
                  color: Colors.grey,
                ),
                hint: Text('Monthly'),
                value: selectedMonth,
                onChanged: (String? newValue) {
                  // Update selected month when the value changes
                  setState(() {
                    selectedMonth = newValue;
                  });
                },
                items: months.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: SfCircularChart(
                tooltipBehavior: TooltipBehavior(
                  duration: 1,
                  enable: true,
                  builder: (dynamic data, dynamic point, dynamic series,
                      int pointIndex, int seriesIndex) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: data[pointIndex].color,
                                ),
                              ),
                              Text(
                                data[pointIndex].label,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${data[pointIndex].traffic}%',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                series: <CircularSeries>[
                  PieSeries<ChartData, int>(
                    dataSource: selectedMonth != null
                        ? getDataForMonth(selectedMonth!)
                        : data, // Use default data or data for selected month
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.traffic,
                    dataLabelSettings: DataLabelSettings(
                        isVisible: false), // Hide default data labels
                    pointColorMapper: (ChartData data, _) =>
                        data.color, // Color mapper for data points
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<ChartData> getDataForMonth(String month) {
    // Add your logic to fetch data for the selected month
    // For example:
    if (month == 'January') {
      return [
        ChartData(day: 1, traffic: 60, label: 'Your Files', color: AppColors.lightBlue),
        ChartData(day: 2, traffic: 40, label: 'System', color: AppColors.darkBlue),
        // ChartData(day: 2, traffic: 40, label: 'System', color: AppColors.lightBlue),
        
      ];
    } else if (month == 'February') {
      return [
        ChartData(
            day: 1,
            traffic: 50,
            label: 'Your Files',
            color: AppColors.lightGrey),
        ChartData(
            day: 2, traffic: 30, label: 'System', color: AppColors.darkBlue),
        ChartData(
            day: 3, traffic: 20, label: 'Other', color: AppColors.lightBlue),
      ];
    }

    return [];
  }
}

class ChartData {
  final int day;
  final double traffic;
  final String label;
  final Color color;


  ChartData(
      {required this.day,
      required this.traffic,
      required this.label,
      required this.color});

}
