import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondary_phone_number_app/src/features/authentication/screens/introduction_screens/introduction_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: IntroductionScreen(),
    );
  }
}