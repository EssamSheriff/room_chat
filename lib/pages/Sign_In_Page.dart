import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:room_chat/utils/Constants.dart';
import 'package:room_chat/pages/chat_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _Show_Password = false;
  String _email;
  String _password;
  bool _Show_Sinpper = false;
  final _auth = FirebaseAuth.instance;

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
                              text: " in",
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
                        onChanged: (value) {
                          _password = value;
                        },
                        keyboardType: TextInputType.emailAddress,
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
                      Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Alert_message(context);
                          },
                          child: Text(
                            "Forget Your Password !?",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RaisedButton(
                          padding: EdgeInsets.fromLTRB(40.0, 16.0, 30.0, 16.0),
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              bottomLeft: Radius.circular(40.0),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              _Show_Sinpper = true;
                            });

                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);

                              if (user != null) {
                                setState(() {
                                  _Show_Sinpper = false;
                                });
                                print(user);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatScreen()));
                              }
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
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Google_rounded_button(context),
                          SizedBox(
                            width: 15,
                          ),
                          Facebook_rounded_button(context),
                        ],
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
