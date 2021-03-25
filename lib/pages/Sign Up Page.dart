import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:room_chat/utils/Constants.dart';
import 'package:room_chat/pages/chat_screen.dart';

class Sign_UP extends StatefulWidget {
  @override
  _Sign_UPState createState() => _Sign_UPState();
}

class _Sign_UPState extends State<Sign_UP> {
  final _auth = FirebaseAuth.instance;
  String _email;
  String _username;
  String _password;
  bool _Show_Sinpper = false;
  bool _Show_Password = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _Show_Sinpper,
          child: Scaffold(
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Sign",
                              style: TextStyle(
                                color: Colors.yellow[600],
                                fontSize: 60,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " up",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _username = value;
                        },
                        decoration: InputDecoration(
                          focusColor: Colors.redAccent,
                          labelText: "User Name",
                          labelStyle: KTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        onChanged: (value) {
                          _email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: KTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          _password = value;
                        },
                        obscureText: !_Show_Password,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _Show_Password = !_Show_Password;
                              });
                            },
                            icon: Icon(
                              FontAwesomeIcons.eye,
                              color: _Show_Password
                                  ? Colors.yellow[700]
                                  : Colors.grey,
                            ),
                          ),
                          focusColor: Colors.redAccent,
                          labelText: "Password",
                          labelStyle: KTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "By Clicking Sign Up you agree to the following",
                              style: KTextStyle,
                            ),
                            TextSpan(
                              text: " terms and conditions",
                              style: TextStyle(
                                color: Colors.yellow[900],
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " with our reservations.",
                              style: KTextStyle,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  bottomLeft: Radius.circular(40.0))),
                          onPressed: () async {
                            setState(() {
                              _Show_Sinpper = true;
                            });

                            try {
                              final UserEmail =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: _email, password: _password);
                              if (UserEmail != null) {
                                print(UserEmail.email);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()));
                              }

                              setState(() {
                                _Show_Sinpper = false;
                              });
                            } catch (e) {
                              print(e);
                              setState(() {
                                _Show_Sinpper = false;
                              });
                              CoolAlert.show(
                                context: context,
                                type: CoolAlertType.error,
                                title: "Oops...",
                                text: "Please,Enter Your Data Correct",
                              );
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22.0),
                              ),
                              SizedBox(width: 15.0),
                              Icon(
                                Icons.arrow_forward_outlined,
                                size: 28.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Google_rounded_button(context),
                            SizedBox(
                              width: 10,
                            ),
                            Facebook_rounded_button(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
