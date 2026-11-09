
import 'package:my_first_app/E-commerce/Homesignin.dart';

import 'Homeloginscreen.dart';
import 'package:flutter/material.dart';

class Slashscreen extends StatefulWidget {
  const Slashscreen({super.key});

  @override
  State<Slashscreen> createState() => _SlashscreenState();
}

class _SlashscreenState extends State<Slashscreen> {
  @override
void initState(){
  super.initState();
  {
    Future.delayed(Duration(seconds: 3),()
    {
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=>Homesiginin(),
      ),
      );
    });
  }
}
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Own your brand",style: TextStyle(color: Colors.brown,
  fontSize: 30
  
  ),),
  centerTitle: true,

),
body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(Icons.shopping_bag,size: 100,
    color: Colors.deepPurple,
    ),
    SizedBox(width: 50,),
   
    Center(
      child: Text(
        "Welcome to our app",
        style: TextStyle(
          color: Colors.brown,
          fontSize: 40,
        ),
      ),
      
    ),
    SizedBox(width: 50,),
      CircularProgressIndicator(
color: Colors.brown,
    ),
  ],
),


    );
  }
}