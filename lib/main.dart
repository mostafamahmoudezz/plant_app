import 'package:flutter/material.dart';
import 'package:plant_app/my_ui/auth_page.dart';
import 'package:plant_app/my_ui/home_page.dart';
import 'my_ui/splash_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final HomePage homePage = new HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AuthPage(),
    );
  }
}

