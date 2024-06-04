import 'package:aplikasi/pages/MyHomePage.dart';
import 'package:aplikasi/pages/homePage.dart';
import 'package:aplikasi/pages/login.dart';
import 'package:aplikasi/pages/register.dart';
import 'package:aplikasi/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
