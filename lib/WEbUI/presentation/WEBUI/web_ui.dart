import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/color.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/extensions.dart';
import 'package:notifications/BlocSelectorApi/Data/DataResource/Resources/styles.dart';
import 'package:notifications/WEbUI/Data/Resources/strings.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_image.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_text.dart';
import 'package:notifications/WEbUI/presentation/Common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Components/left_container.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Components/right_container.dart';

class WebUI extends StatefulWidget {

  @override
  State<WebUI> createState() => _WebUIState();
}

class _WebUIState extends State<WebUI> {
  @override
  
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isSmallScreen = constraints.maxWidth <= 600;

        return Scaffold(
          body: Row(
            children: [
              if (!isSmallScreen)
                   LeftContainer(forLargeScreen: true,),
              if (!isSmallScreen) RightContainer(isSmallScreen: isSmallScreen) ,
              if (isSmallScreen) LeftContainer(forLargeScreen: false,),
            ],
          ),
        );
      },
    );
  }
}
