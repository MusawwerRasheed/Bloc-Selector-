import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notifications/Notification/Api/firebase_api.dart';

 
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? fcmToken;

  @override
  void initState() {
    super.initState();
    // Fetch FCM token when the widget initializes
    initFcmToken();
  }

  Future<void> initFcmToken() async {
    // Retrieve the FCM token asynchronously
    String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      fcmToken = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(fcmToken ?? 'FCM Token not available'),
            Text('home'),
          ],
        ),
      ),
    );
  }
}
