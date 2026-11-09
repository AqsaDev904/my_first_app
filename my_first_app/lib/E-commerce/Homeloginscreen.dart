import 'package:flutter/material.dart';
import 'Product.dart';

class Homeloginscreen extends StatefulWidget {
  final String email;
  final String password;

  const Homeloginscreen({
  super.key,
  required this.email,
  required this.password,
});

  @override
  State<Homeloginscreen> createState() => _HomeloginscreenState();
  

}

class _HomeloginscreenState extends State<Homeloginscreen> {
  TextEditingController emailcontroller = TextEditingController();
   TextEditingController passwordcontroller = TextEditingController();
   
   
    bool password = true;


    void login(){
      String email = emailcontroller.text.trim();
      String pass = passwordcontroller.text.trim();
     
   
      if (email.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Email is required"),),
        );
      }
      else if (pass.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password is required"),),
        );}
        
        
        else {
          ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Login is match")
),
          );
        }
         

    }
  @override
  void initState(){
    super.initState();
emailcontroller.text = widget.email;
passwordcontroller.text = widget.password;
  }
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
     
      SizedBox(height: 30,),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          
        ),
        onPressed: (){
          login();
          
          Navigator.push(context, 
          MaterialPageRoute(
              builder: (context) => Product(),
           ),
          );
          emailcontroller.clear();
          passwordcontroller.clear();
          
          
        }, child: Text("Login",style: TextStyle(
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