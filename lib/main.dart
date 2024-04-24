import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notifications/BlocSelectorApi/Data/AppData/Providers/providers.dart';
import 'package:notifications/BlocSelectorApi/Presentation/Widget/Posts/posts_screen.dart';
import 'package:notifications/WEbUI/presentation/WEBUI/web_ui.dart';
import 'Notification/firebase_options.dart';


final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotification();
  runApp(MultiBlocProvider(providers: appProviders, child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, build) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat Now',
          home: PostsScreen(), 
        );
      },
    );
  }
}
