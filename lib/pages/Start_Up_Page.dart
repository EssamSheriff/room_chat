import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:room_chat/pages/Sign%20Up%20Page.dart';
import 'package:room_chat/pages/Sign_In_Page.dart';
import 'package:room_chat/utils/RoundedButton.dart';

class StartUP_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TypewriterAnimatedTextKit(
              text: [' Room Chat '],
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            RoundedButton(
              color: Color(0xff6D426D),
              onpress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              text: "Log In",
            ),
            RoundedButton(
              text: 'Register',
              onpress: () {
                //Go to registration screen.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sign_UP()));
              },
              color: Colors.yellow[700],
            ),
          ],
        ),
      ),
    );
  }
}
