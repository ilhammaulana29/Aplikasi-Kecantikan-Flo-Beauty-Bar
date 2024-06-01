import 'package:aplikasi/pages/login.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Image.asset(
                'images/welcome.png',
                height: 300,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Hello",
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Salsa',
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Selamat Datang Di Aplikasi Kecantikan Flo Beauty Bar',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Salsa', color: Colors.black87),
              ),
              SizedBox(
                height: 51,
              ),
              Container(
                height: 60,
                width: 20,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF8181), // Warna tombol
                    shadowColor: Colors.black, // Warna bayangan
                    elevation: 3, // Tinggi bayangan
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 60,
                width: 20,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna tombol
                    side: BorderSide(color: Color(0xFFFF8181), width: 2),
                    shadowColor: Colors.black, // Warna bayangan
                    elevation: 3, // Tinggi bayangan
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFF8181),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Lewati",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Roboto',
                ),
              ),
            ],
          ),
        ));
  }
}
