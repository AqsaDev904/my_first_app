
import 'package:flutter/material.dart';
import 'package:my_first_app/Get_api.dart';

import 'package:my_first_app/authentication/Splash.dart';

import 'Login_screen.dart';
import 'Todoapp.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
home: Splash(),
        );
  }

}