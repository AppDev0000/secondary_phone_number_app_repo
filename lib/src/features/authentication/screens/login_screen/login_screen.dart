import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            // Sign in with Google button
            Container(
              padding: EdgeInsets.all(30.0),
              alignment: Alignment(0.0, 0.15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign in with Google')),
              ),
            ),
            // Sign in with Apple button
            Container(
              padding: EdgeInsets.all(30.0),
              alignment: Alignment(0.0, -0.15),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Sign in with Apple')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
