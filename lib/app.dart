import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prime_video_flutter_ui_kit/constants/constants.dart';
import 'package:prime_video_flutter_ui_kit/screens/splash/splash.dart';
import 'package:prime_video_flutter_ui_kit/utils/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstant.appTitle,
      defaultTransition: Transition.fadeIn,
      theme: customTheme,
      darkTheme: customTheme,
      home: SplashViewScreen(),
    );
  }
}
