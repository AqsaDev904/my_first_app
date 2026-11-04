import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Second page"),
        
      ) ,
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("POP TO THE FIRST PAGE"),),
          ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/Thirdpage');
  },
  child: Text("Go to Third  Page"),
)
        ],
      ),
      
    );
  }
}