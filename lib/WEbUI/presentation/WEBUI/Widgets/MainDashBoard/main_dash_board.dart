import 'package:flutter/material.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/LargeScreen/large.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/MediumScreen/medium.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/MainDashBoard/Components/Skeleton/SmallScreen/small.dart';

class MainDashBoard extends StatelessWidget {
  const MainDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          print(screenWidth);
          if (screenWidth <= 500) {
            return SmallScreenLayout();
          } else if (screenWidth <= 800) {
            return MediumScreenLayout();
          } else
            return LargeScreenLayout();
        },
      ),
    );
  }
}
