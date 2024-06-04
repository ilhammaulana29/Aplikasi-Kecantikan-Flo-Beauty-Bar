import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _savePassword = false; // State for checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Text(
              'Register',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              hintText: 'Nama',
              icon: Icons.person,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20),
            _buildTextField(
              hintText: 'Email',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            _buildTextField(
              hintText: 'No. Telephone',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            _buildTextField(
              hintText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            _buildTextField(
              hintText: 'Konfirmasi Password',
              icon: Icons.shield,
              obscureText: true,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: Text('Simpan Kata Sandi'),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    value: _savePassword,
                    onChanged: (bool? value) {
                      setState(() {
                        _savePassword = value ?? false;
                      });
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: Text('Lupa Kata Sandi?'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Handle register action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Sudah punya akun? Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: Icon(icon, color: Color(0xFFFF8181)),
        ),
      ),
    );
  }
}
