import 'package:chat_application/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widget/chat_widget_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            Spacer(),
            Divider(),
            InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Icon(Icons.logout), Text("Logout")],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: mq.height*.02),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return ChatUserCard();
        },
        itemCount: 18,
      ),
    );
  }
}
