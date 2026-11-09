import 'package:flutter/material.dart';

class Student  extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  TextEditingController studentnameController = TextEditingController();
  List <String> Studentname = [];
  
  void addstudent(){
    String name =  studentnameController.text.trim();
    setState(() {
      Studentname.add(name);
      
    });
    
  }
  void editstudent(int index){
      TextEditingController editingController =  TextEditingController(text: Studentname[index]);
      showDialog(context: context, 
      builder: (context){
        return AlertDialog(
title: Text("edit student"),
content: TextField(
  controller: editingController,
  decoration: InputDecoration(
    label: Text("edit name"),

  ),
),
actions: [
   TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(onPressed: (){
            if(editingController.text.trim().isNotEmpty){
               setState(() {
                  Studentname[index] =
                      editingController.text.trim();
                });

                Navigator.pop(context);
              }
            
          
          }, child: Text("update"))

],
        );
      }
      );
       }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.brown,
      title: Text("Student management system"),
    ),
    body: Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey
      ),
      child: Column(
        children: [
         TextField(
          controller: studentnameController,
          decoration: InputDecoration(
            hint: Text("Enter student",style: TextStyle(color: const Color.fromARGB(255, 1, 26, 26)),),
            label: Text("Student name",style: TextStyle(color: const Color.fromARGB(255, 4, 62, 62)),),
          ),
         ),
         ElevatedButton(
          onPressed: 
          (){
             
            addstudent();
       studentnameController.clear();
         }, child: Text("Add student"),),
        Expanded(
  child: ListView.builder(
    itemCount: Studentname.length,
    itemBuilder: (context, index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(Studentname[index]),
          ),

          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                Studentname.removeAt(index);
              });
            },
            icon: Icon(Icons.delete),
            label: Text("Delete"),
          ),
           ElevatedButton.icon(
            onPressed: (
           
            ) {
             editstudent(index);
            },
            icon: Icon(Icons.edit),
            label: Text("update"),
          ),
        
        ],
      );
    },
  ),
),  
        ],
      ),
    ),
    );

  }
}