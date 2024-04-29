import 'dart:ui';
import 'package:flutter/material.dart'; 
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/LoginScreen/Components/left_container.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/Widgets/LoginScreen/Components/right_container.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) { 

    double boxReference =  MediaQuery.of(context).size.width;
        final bool isSmallWidth = constraints.maxWidth <= 600;
        final bool isSmallHeight = constraints.maxHeight <= 700;

        return Scaffold(
          body: Row(
            children: [
              if (!isSmallWidth)
                LeftContainer(forLargeScreen: true , reference: boxReference,),
              if (!isSmallWidth) 
                RightContainer( reference: boxReference, isSmallScreen: isSmallWidth),
              if (isSmallWidth )
                LeftContainer(forLargeScreen: false, reference: boxReference,),
         
            ],
          ),
        );
      },
    );
  }
}


 
 