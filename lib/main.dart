import 'package:flutter/material.dart';
import 'package:vachanapp/Screens/Auth_Page.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home : Scaffold(
        body: AuthPage(), // have to change here main page
     ),
      debugShowCheckedModeBanner: false,
    );

  }

}

