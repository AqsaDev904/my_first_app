import 'package:flutter/material.dart';
import 'package:my_first_app/authentication/Home.dart';
import 'package:my_first_app/authentication/Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  


  State<Login> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login> {
  @override
void initState() {
  super.initState();
  read();
}
TextEditingController emailcontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
bool passwordhidden = true;
Future<void> save() async{
final perf = await SharedPreferences.getInstance();
await perf.setString("email", emailcontroller.text);
await perf.setString("password", passwordcontroller.text);
}
Future<void> read() async {
  final prefs = await SharedPreferences.getInstance();

  String? savedemail = prefs.getString('email');
String?  savepassword = prefs.getString('password');
setState(() {
    emailcontroller.text = savedemail ?? "";
    passwordcontroller.text = savepassword ?? "";
  });
 
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Welcome to login screen"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
TextField(
  controller: emailcontroller,
  decoration: InputDecoration(
    hint: Text("Enter data"),
    label: Text("Email"),
  ),
),
SizedBox(height: 30,),
TextField(
  obscureText: passwordhidden,
   controller: passwordcontroller,
  decoration: InputDecoration(
  
  hint: Text("Enter password"),
suffixIcon: IconButton(onPressed: (){
setState(() {
  passwordhidden = !passwordhidden;
});
}, icon: Icon(
  passwordhidden ?
  Icons.visibility : Icons.visibility_off_outlined ),),
  label: Text("password"),
),

),
SizedBox(height: 20,),
ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.purple
  ),
 
onPressed: () async {

  final prefs = await SharedPreferences.getInstance();

  String? savedemail = prefs.getString("email");
  String? savedpassword = prefs.getString("password");

  String enteredemail = emailcontroller.text.trim();
  String enteredpassword = passwordcontroller.text;

  if (savedemail == null || savedpassword == null) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please Sign Up first!"),
        backgroundColor: Color.fromARGB(255, 244, 54, 200),
      ),
    );

  }

  else if (enteredemail == savedemail &&
      enteredpassword == savedpassword) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login Successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );

  }

  else {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Invalid Email or Password!"),
        backgroundColor: Color.fromARGB(255, 244, 54, 158),
      ),
    );

  }
}, child: Text("Login",style: TextStyle(color: const Color.fromARGB(95, 12, 9, 9),fontSize: 20),),),

Center(
  child: Row(
    children: [
      Text("If you dont have account , Click here : "),
  
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purpleAccent
        ),
        onPressed: (){

          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> Signup(),
          ),
          );
        }, child: Text("Sign up")),
    ],
  
  ),
),
          ],
        ),
      ),
    );
  }
}