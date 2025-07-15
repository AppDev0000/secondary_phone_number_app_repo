import 'package:flutter/material.dart';
import 'package:secondary_phone_number_app/src/features/authentication/services/google_auth_service.dart';
import 'package:secondary_phone_number_app/src/features/core/screens/home_screen/home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
                    onPressed: () {
                      signInWithGoogle().then((result) {
                        if(result!=null){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context){
                                  return HomeScreen();
                                },
                            ),
                          );
                        }
                      });
                    },
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
