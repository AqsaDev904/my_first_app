import 'package:flutter/material.dart';
import 'package:my_first_app/E-commerce/Homeloginscreen.dart';

class Homesiginin extends StatefulWidget {
  const Homesiginin({super.key});

  @override
  State<Homesiginin> createState() => _HomesigininState();
}

class _HomesigininState extends State<Homesiginin> {
  TextEditingController emailcontroller = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();
    TextEditingController cpasswordcontroller = TextEditingController();
        TextEditingController usernamecontroller = TextEditingController();
    bool password = true;


    void signin(){
      String email = emailcontroller.text.trim();
      String pass = passwordcontroller.text.trim();
     
      String cpass = cpasswordcontroller.text.trim();
      String username = usernamecontroller.text.trim();
      if (email.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Email is required"),),
        );
      }
      else if(username.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Name is required"),),
        );

      }
      else if (pass.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password is required"),),
        );}
         else if (cpass.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Conform Password is required"),),
        );
         }
         else if (pass != cpass){
 ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password is  not same"),),);
        }
      
         
else {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => Homeloginscreen(
      email :  email,
      password : pass,
      ),
    ),
  );
}
    }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  title: Text("Welcome to login page",style: TextStyle(
    color: Colors.brown,
    fontSize: 30

  ),),
  actions: [
    Icon(Icons.login),
  ],
  centerTitle: true,
),
body: Center(
  child: Container(
    width: 500,
    height: 600,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
   color: Colors.black.withOpacity(0.3),
  blurRadius: 20,
          spreadRadius: 5,
          offset: Offset(0, 5),
        ),
      ]
    ),
    child: Column(
    
    children: [
      Padding(padding: EdgeInsets.all(30)),
       TextField(
          
        controller: usernamecontroller,
        
decoration: InputDecoration(
  suffixIcon: Icon(Icons.person),
  label: Text("User name",style: TextStyle(
    fontSize: 26,
    color: Colors.brown
  ),),
  
  hint: Text("ENTER Username"),
 
  contentPadding: EdgeInsets.all(30),
  
),),
      TextField(
        controller: emailcontroller,
decoration: InputDecoration(
  suffixIcon: Icon(Icons.email),
  label: Text("Email",style: TextStyle(
    fontSize: 26,
    color: Colors.brown
  ),),
  
  hint: Text("ENTER EMAIL"),
 
  contentPadding: EdgeInsets.all(30),
  
),
      ),
      TextField(
          obscureText: password,
        controller: passwordcontroller,
        
decoration: InputDecoration(
  suffixIcon: IconButton(onPressed: (){}, icon: Icon( password ?Icons.visibility_off:Icons.visibility,),),
  label: Text("Password",style: TextStyle(
    fontSize: 26,
    color: Colors.brown
  ),),
  
  hint: Text("ENTER Password"),
 
  contentPadding: EdgeInsets.all(30),
  
),
      ),
      TextField(
        controller: cpasswordcontroller,
        obscureText: password,
decoration: InputDecoration(
  suffixIcon: IconButton(onPressed: (){
    setState(() {
      password = !password;
     
    });
  }, icon: Icon(
    password ?Icons.visibility_off:Icons.visibility,
  ),),
  label: Text("Conform password",style: TextStyle(
    fontSize: 26,
    color: Colors.brown
  ),),
  
  hint: Text("ENTER Conform password"),
 
  contentPadding: EdgeInsets.all(30),
  
),
      ),
      SizedBox(height: 30,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          
        ),
        onPressed: (){
          signin();
          emailcontroller.clear();
          passwordcontroller.clear();
          cpasswordcontroller.clear();
        }, child: Text("Sign in",style: TextStyle(
          color: Colors.white,
        ),)),
        SizedBox(height: 20,),
       

    ],
    
    ),
    
  ),
),

    );
    
  }
}