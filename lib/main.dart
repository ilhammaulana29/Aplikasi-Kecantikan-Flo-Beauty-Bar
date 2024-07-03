import 'package:flutter/material.dart';
import 'package:aplikasi/pages/MyHomePage.dart';
import 'package:aplikasi/pages/login.dart';
import 'package:aplikasi/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> _isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _isLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.data ?? false) {
              return MyHomePage();
            } else {
              return WelcomePage();
            }
          }
        },
      ),
      routes: <String, WidgetBuilder>{
        '/MyHomePage': (BuildContext context) => new MyHomePage(),
        '/LoginPage': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
