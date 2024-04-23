import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension CustomSizedBox on num {
  SizedBox get x => SizedBox(width: w);
  SizedBox get y => SizedBox(height: h);
 }



 extension customPadding on EdgeInsetsGeometry{
  EdgeInsetsGeometry get paddingOnly { 
    EdgeInsetsGeometry p  = EdgeInsets.only();
     return p ; 
  }
 }
 



extension str on String {
  String get readableTime {
    DateTime dateTime = DateTime.parse(this);
    String timeString = DateFormat.Hm().format(dateTime);
    return timeString;
  }
}
