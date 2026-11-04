import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Todoapp.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
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
    await save();
    await read();
 Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Todoapp(),
      ),
    );
 
    print(emailcontroller.text);
      print(passwordcontroller.text);
      emailcontroller.clear();
       passwordcontroller.clear();

}, child: Text("Login",style: TextStyle(color: const Color.fromARGB(95, 12, 9, 9),fontSize: 20),),),
          ],
        ),
      ),
    );
  }
}