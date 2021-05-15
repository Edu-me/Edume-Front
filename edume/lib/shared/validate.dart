import 'package:flutter/material.dart';

class Validate{
  static bool isPasswordCompliant(String password)
  {
    bool isComplient = false;
    bool hasUppercase  = false;
    bool hasDigits = false;
    bool hasLowercase = false;
    bool hasSpecialCharacters = false;
    var character='';
    var i=0;
    if (!password?.isEmpty) {
      // Check if valid special characters are present
      hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      while (i < password.length){
        character = password.substring(i,i+1);
        print(character);

        if (isDigit(character , 0)){
          hasDigits=true;
        }else{

          if (character == character.toUpperCase()) {
            hasUppercase=true;
          }
          if (character == character.toLowerCase()){
            hasLowercase=true;
          }
        }
        i++;
      }
    }
    isComplient = hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters;
    return isComplient;
  }

  static bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

  static String validateName(String msg){
    return "This field is required";
  }
  static String validateEmail(String msg){
    if(msg.isEmpty)
      return "This field is required";
    else
      return "Enter a valid email";
  }

  static String validatePhone(String msg){
    if(msg.isEmpty)
      return "This field is required";
    else
      return "Enter a valid Phone number";
  }


  static String validatePassword(String msg){
    if(msg.isEmpty)
      return "This field is required";
    else
      return "Enter a valid password";
  }

  static String validateConfirmPass(String msg, String msg2){
    if(msg.isEmpty)
      return "This field is required";
    else if(msg!=msg2)
      return "Two passwords must match";
  }

//alert dialogue
  static showAlertDialog(BuildContext context , String msg) {
    // set up the buttons
    Widget remindButton = FlatButton(
      child: Text("Ok"),
      onPressed:  () {
        Navigator.of(context).pop(); // dismiss dialog
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
          "Take care!"
      ),
      content: Text(msg),
      actions: [
        remindButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}