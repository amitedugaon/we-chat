

import 'dart:developer';
import 'dart:io';

import 'package:chat_application/main.dart';
import 'package:chat_application/screen/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/dilogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // void _handleSignIn() async {
  //   try {
  //     await _googleSignIn.signIn();
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => HomePage(),
  //         ));
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //     // Handle sign-in errors.
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Welcome to we chat"),
        ),
        body: Column(
          children: [
            SizedBox(height: mq.height * .13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/chat.png",
                  width: mq.height * .15,
                ),
              ],
            ),
            SizedBox(height: mq.height * .3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:  _handleGoogleBtnClick,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set your button color here.
                    elevation: 2, // Adjust the elevation as needed.
                  ),
                  child: Text('Sign in with Google'),
                )
              ],
            )
          ],
        ));
  }

  _handleGoogleBtnClick(){
    Dialogs.showProgressbar(context);
    _signInWithGoogle().then((user){
      Navigator.pop(context);
           if(user!=null){
             log('\nUser :${user.user}');
             log('\nUser :${user.additionalUserInfo}');

             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
           }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {

    try{
      await InternetAddress.lookup('google.com');

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    catch(e){
      log('\n Signinwithgoogle: ${e}');
      Dialogs.showSnackbar(context,"Something went Worng (Check Internet)");
    }
    return null;


  }
}
