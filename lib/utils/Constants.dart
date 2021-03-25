import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cool_alert/cool_alert.dart';

Future Alert_message(BuildContext context) {
  return CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: "Oops...",
    text: "Sorry, not activated yet",
  );
}

const KTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);

Widget Facebook_rounded_button(BuildContext context) {
  return OutlineButton.icon(
    highlightedBorderColor: Colors.black54,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    borderSide: BorderSide(
      color: Colors.blue,
    ),
    textColor: Colors.blue,
    onPressed: () {
      Alert_message(context);
    },
    icon: Icon(
      FontAwesomeIcons.facebook,
      size: 16,
    ),
    label: Text(
      "Facebook",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

Widget Google_rounded_button(BuildContext context) {
  return OutlineButton.icon(
    highlightedBorderColor: Colors.black54,
    borderSide: BorderSide(
      color: Colors.redAccent,
    ),
    textColor: Colors.redAccent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    onPressed: () {
      Alert_message(context);
    },
    icon: Icon(
      FontAwesomeIcons.googlePlus,
      size: 16,
    ),
    label: Text(
      "Google",
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
}

const kSendButtonTextStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.grey, width: 2.0),
  ),
);
