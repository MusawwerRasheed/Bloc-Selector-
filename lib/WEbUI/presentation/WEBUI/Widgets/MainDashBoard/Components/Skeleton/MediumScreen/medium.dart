import 'package:flutter/material.dart';

class MediumScreenLayout extends StatefulWidget {
  MediumScreenLayout({Key? key}) : super(key: key);

  @override
  
  State<MediumScreenLayout> createState() => _MediumScreenLayoutState();
}

class _MediumScreenLayoutState extends State<MediumScreenLayout> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medium Screen Layout'),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Colors.blue,
        child: Row(
          children: [],
        ),
      ),
    );
  }
}
