import 'dart:math';

import 'package:flutter/material.dart';

class SmallScreenLayout extends StatefulWidget {
  SmallScreenLayout({Key? key}) : super(key: key);

  @override
  State<SmallScreenLayout> createState() => _SmallScreenLayoutState();
}

class _SmallScreenLayoutState extends State<SmallScreenLayout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
   print(screenWidth);
   log(screenWidth);
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Screen Layout'),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.red,
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
