import 'package:chat_application/main.dart';
import 'package:chat_application/page/login_page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Registration Page"),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter Name")),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter email")),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Enter Password")),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {

                  try{
                    signUpWithEmailPassword( emailController.text,  passwordController.text);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SplashScreen()));
                  }
                  catch(e){
                    FlutterError(e.toString());
                  }


                },
                child: Text("Submit")),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("Already have Account Login"),
            )
          ],
        ),
      ),
    ));
  }


  Future<void> signUpWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User registration successful
    } catch (e) {
      // Handle registration errors
      print(e.toString());
    }
  }

}
