import 'package:flutter/material.dart';
import 'package:weather_kodluyoruz/screens/loading_screen.dart';
import 'package:weather_kodluyoruz/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: LoadingScreen(),
    );
  }
}