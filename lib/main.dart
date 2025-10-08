import 'package:alertdigital/preloader.dart';
import 'package:alertdigital/webview.dart';
import 'package:flutter/material.dart';
import 'ddd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Link',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF004FAE)),
        fontFamily: 'Arsenal',
        useMaterial3: true,
      ),
      home:  PreLoader(),
    );
  }
}
