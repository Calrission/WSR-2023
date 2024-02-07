import 'package:final_wsr_2023/core/theme.dart';
import 'package:final_wsr_2023/on_boarding/presentation/pages/page_on_boarding.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const OnBoardingPage(),
    );
  }
}