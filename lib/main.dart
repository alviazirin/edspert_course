import 'package:edspert_course/common/appcolors.dart';
import 'package:edspert_course/common/presentation/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppColors.appThemeData,
      home: SplashScreen(),
    );
  }
}
