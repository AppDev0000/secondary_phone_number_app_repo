import 'package:flutter/material.dart';
import 'package:secondary_phone_number_app/src/features/authentication/services/google_auth_service.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/registration_screen/registration_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.white),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Column(
              children: [
                Text("Home screen"),
                Container(
                  padding: EdgeInsets.all(30.0),
                  alignment: Alignment(0.0, -0.15),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // here I should solve the problem of signing out from where? google or apple...

                        //1.) google sign out
                        signOutGoogle();

                        //2.) apple sign out

                        // returning to registration screen
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              return RegistrationScreen();
                            },
                          ),
                          ModalRoute.withName('/'),
                        );
                      },
                      child: const Text('Sign out'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
