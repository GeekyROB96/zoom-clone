// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Start Or Join a meeting",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36.0),
              child: Image.asset('assets/onboarding_image.jpg'),
            ),
            CustomButton(
              text: 'Google Sign In',
              onPressed: () async {
                bool res = await _authMethods.signWithGoogle(context);
                if (res) {
                  Navigator.pushNamed(context, '/home-screen');
                }
              },
            )
          ]),
    );
  }
}
