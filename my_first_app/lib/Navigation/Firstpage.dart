import 'package:flutter/material.dart';
import 'package:my_first_app/Navigation/Thirdpage.dart';
import 'Secondpage.dart';
import 'Thirdpage.dart';
class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text("First page"),
  ),


body: Column(
  children: [
    ElevatedButton(onPressed: (){
      Navigator.push(context,
     MaterialPageRoute(
        builder: (context) => Secondpage(),
      ),
       );
    }, child: Text("Push to the next screeen")),
     ElevatedButton(onPressed: (){
       Navigator.push(context,
     MaterialPageRoute(
        builder: (context) => Thirdpage(),
      ),
       );
      }, child: Text("Push TO THE Third page"),),
        ],
  
),

    ) ;
  }
}