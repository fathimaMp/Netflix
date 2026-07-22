import 'package:flutter/material.dart';
import 'package:netflix_app/core/colours/colors.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          bodyLarge : TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        )
      ),
      home: ScreenMainPage(),
    );
  }
}