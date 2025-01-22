// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_app/features/bottom_navbar.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: BottomNavbar(),
    );
  }
}
