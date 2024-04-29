import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension CustomSizedBox on num {
  SizedBox get x => SizedBox(width: w);
  SizedBox get y => SizedBox(height: h);
 }

 extension CustomPadding on Padding {
  double get p {
    // Extracting the padding value from EdgeInsetsGeometry
    final EdgeInsets edgeInsets = padding as EdgeInsets;
    // Returning the padding value
    return edgeInsets.horizontal;
  }
}
extension NumberParsing on String {
  int parseInt()
   {
   return int.parse(this);
  }
 }


 