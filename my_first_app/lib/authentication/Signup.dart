import 'package:flutter/material.dart';
import 'Login.dart';
import 'package:my_first_app/authentication/Login.dart';
import 'package:my_first_app/authentication/Signup.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _Login_screenState();
}

class _Login_screenState extends State<Signup> {
TextEditingController emailcontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController passwordcontroller = TextEditingController();
bool passwordhidden = true;

Future<void> save() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setString("username", usernamecontroller.text.trim());
  await prefs.setString("email", emailcontroller.text.trim());
  await prefs.setString("password", passwordcontroller.text);
}

Future<void> read() async {
  final prefs = await SharedPreferences.getInstance();

  String? savedemail = prefs.getString('email');
    String? savedusername = prefs.getString('username');
String?  savepassword = prefs.getString('password');
  print(save);
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
  controller: usernamecontroller,
  decoration: InputDecoration(
    hint: Text("Enter username"),
    label: Text("username"),
  ),
),
SizedBox(height: 30,),
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

  if (usernamecontroller.text.isEmpty ||
      emailcontroller.text.isEmpty ||
      passwordcontroller.text.isEmpty) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please fill all fields!"),
      ),
    );

    return;
  }

  await save();

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("Account Created Successfully!"),
    ),
  );

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const Login()),
  );


}, child: Text("Signup",style: TextStyle(color: const Color.fromARGB(95, 12, 9, 9),fontSize: 20),),),
          ],

        ),
      ),
    );
  }
}