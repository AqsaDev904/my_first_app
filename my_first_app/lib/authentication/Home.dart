import 'package:flutter/material.dart';
import 'package:my_first_app/authentication/Splash.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("Welcome to home page",style: TextStyle(
    color: Colors.purple,
  ),),

),
body: Center(
  child: Column(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent
        ),
        
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Splash(),),);

      }, child: Text("Logout"),),
    ],
  ),
),

    );
  }
}