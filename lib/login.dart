import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './globals.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _secureText = true;
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset(
              'assets/images/logo.png',
              height: 80,
              width: 80,
            ),
          ),
          Card(
            elevation: 6.0,
            margin:
                const EdgeInsets.only(right: 20, left: 20, top: 25, bottom: 10),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Icon(Icons.person, color: primaryColor),
                  ),
                  contentPadding: EdgeInsets.all(18),
                  labelText: "Username"),
              controller: _username,
            ),
          ),
          Card(
            elevation: 6.0,
            margin:
                const EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 10),
            child: TextFormField(
              obscureText: _secureText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 15),
                  child: Icon(Icons.password_rounded, color: primaryColor),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _secureText = !_secureText;
                    });
                  },
                  icon: Icon(
                      _secureText ? Icons.visibility_off : Icons.visibility),
                ),
                contentPadding: const EdgeInsets.all(18),
              ),
              controller: _password,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                if (_username.text == username && _password.text == password) {
                  Get.put({'nama': _username.text});
                  Get.offAllNamed('/home');
                } else {
                  Get.snackbar('Error', 'username dan password salah',
                      backgroundColor: Colors.red[200]);
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, letterSpacing: 2),
                  minimumSize: const Size(150, 40),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('MASUK'))
        ],
      ),
    );
  }
}
