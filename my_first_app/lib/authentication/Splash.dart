import 'dart:async';

import 'Login.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/Login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
void initState(){
  super.initState();

Timer(Duration(seconds:3),(){
Navigator.pushReplacement(context,
MaterialPageRoute(builder: (context)=>Login())
 );
}


);
}



  Widget build(BuildContext context) {
    return Scaffold(
body: Center(
  child: Container(
   decoration: BoxDecoration(
    color: const Color.fromARGB(255, 251, 7, 255),
   ),
   child: Text("Authentication flow",style: TextStyle(fontSize: 50),),
  ),
),
    );
  }
}