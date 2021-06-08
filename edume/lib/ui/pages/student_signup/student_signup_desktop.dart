import 'dart:convert';

import 'package:edume/shared/auth.dart';
import 'package:edume/shared/validate.dart';
import 'package:edume/ui/pages/login/login_desktop.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentSignUpDesktop extends StatefulWidget {
  @override
  _StudentSignUpDesktopState createState() => _StudentSignUpDesktopState();
}

class _StudentSignUpDesktopState extends State<StudentSignUpDesktop> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  bool nameValidate = false;
  bool emailValidate = false;
  bool phoneValidate = false;
  bool passwordValidate = false;
  bool passwordConfirmValidate = false;

  String nameErrorMsg = "";
  String emailErrorMsg = "";
  String phoneErrorMsg = "";
  String passwordErrorMsg = "";
  String passwordConfrimErrorMsg = "";
  bool showReload = false;
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return new Scaffold(
      body: Builder(
        builder: (context) {
      return ModalProgressHUD(
        inAsyncCall: showReload,
        opacity: 0,
        progressIndicator: CircularProgressIndicator(),
        child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: deviceType == DeviceScreenType.desktop
                    ? BoxFit.fill
                    : BoxFit.cover)),
        child: new SingleChildScrollView(
          child: new Center(
            child: new Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: new Center(
                    child: new Container(
                      width: (MediaQuery.of(context).size.width) / 2,
                      height: (MediaQuery.of(context).size.height) * 1.2,
                      color: Colors.black.withOpacity(0.7),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Join Us',
                            style: TextStyle(fontSize: 50, color: Colors.white),
                          ),

                          Text(
                            'To find the suitable tutor!',
                            style:
                                TextStyle(fontSize: 25, color: Colors.white70),
                          ),
                          //Name input field///////////////////
                          Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextFormField(
                                cursorColor: Colors.black,
                                controller: nameController,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.7),
                                    borderSide: new BorderSide(
                                        color: Colors.red, width: 0.0),
                                  ),
                                  errorText: nameValidate ? nameErrorMsg : null,
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  hintText: "Full Name",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 0.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    child: Icon(Icons.person),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )),
                          //Email input field///////////////////
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 5.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: emailController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.7),
                                    borderSide: new BorderSide(
                                        color: Colors.red, width: 0.0),
                                  ),
                                  errorText:
                                      emailValidate ? emailErrorMsg : null,
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  hintText: "Email",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 0.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    child: Icon(Icons.email),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )),

                          //Number input field///////////////////
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 35.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: phoneController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.7),
                                    borderSide: new BorderSide(
                                        color: Colors.red, width: 0.0),
                                  ),
                                  errorText:
                                      phoneValidate ? phoneErrorMsg : null,
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  hintText: "Phone number",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(
                                          width: 0.0, style: BorderStyle.none)),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 10.0, 10.0, 0.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15.0,
                                        left: 15,
                                        top: 15,
                                        bottom: 15),
                                    child: Icon(Icons.phone_android),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )),
                          //Password input field///////////////////
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  30.0, 35.0, 30.0, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width:
                                        ((MediaQuery.of(context).size.width) /
                                                2) /
                                            2.35,
                                    child: TextFormField(
                                      controller: passwordController,
                                      obscureText: true,
                                      obscuringCharacter: "*",
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        errorBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.7),
                                          borderSide: new BorderSide(
                                              color: Colors.red, width: 0.0),
                                        ),
                                        errorText: passwordValidate
                                            ? passwordErrorMsg
                                            : null,
                                        errorStyle: TextStyle(
                                          color: Colors.red[400],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                        hintText: "Password",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                            borderSide: new BorderSide(
                                                width: 0.0,
                                                style: BorderStyle.none)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                            borderSide: new BorderSide(
                                                width: 0.0,
                                                style: BorderStyle.none)),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 10.0, 0.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0,
                                              left: 15,
                                              top: 15,
                                              bottom: 15),
                                          child: Icon(Icons.vpn_key_sharp),
                                        ),
                                        //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        ((MediaQuery.of(context).size.width) /
                                                2) /
                                            2.35,
                                    child: TextFormField(
                                      controller: passwordConfirmController,
                                      obscureText: true,
                                      obscuringCharacter: "*",
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        errorBorder: new OutlineInputBorder(
                                          borderRadius:
                                              new BorderRadius.circular(25.7),
                                          borderSide: new BorderSide(
                                              color: Colors.red, width: 0.0),
                                        ),
                                        errorText: passwordConfirmValidate
                                            ? passwordErrorMsg
                                            : null,
                                        errorStyle: TextStyle(
                                          color: Colors.red[400],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                        hintText: "Confirm Password",
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                            borderSide: new BorderSide(
                                                width: 0.0,
                                                style: BorderStyle.none)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(25.7),
                                            borderSide: new BorderSide(
                                                width: 0.0,
                                                style: BorderStyle.none)),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 10.0, 0.0),
                                        prefixIcon: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0,
                                              left: 15,
                                              top: 15,
                                              bottom: 15),
                                          child: Icon(Icons.vpn_key_sharp),
                                        ),
                                        //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          /////////////Login button/////////////////
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: RaisedButton(
                                  focusColor: Colors.blueAccent,
                                  padding: EdgeInsets.all(25),
                                  hoverColor: Colors.lightBlue,
                                  onPressed: () async {
                                    setState(() {
                                      (nameController.text.isEmpty)
                                          ? nameValidate = true
                                          : nameValidate = false;
                                      (emailController.text.isEmpty ||
                                              !(emailController.text
                                                  .contains("@", 0)) ||
                                              !(emailController.text
                                                      .contains(".com", 0) ||
                                                  emailController.text
                                                      .contains(".net", 0)))
                                          ? emailValidate = true
                                          : emailValidate = false;
                                      (phoneController.text.isEmpty ||
                                              !(phoneController.text.contains(
                                                  new RegExp(
                                                      "^01[0-2]{1}[0-9]{8}"),
                                                  0)))
                                          ? phoneValidate = true
                                          : phoneValidate = false;
                                      (passwordController.text.isEmpty ||
                                              !Validate.isPasswordCompliant(
                                                  passwordController.text))
                                          ? passwordValidate = true
                                          : passwordValidate = false;
                                      (passwordConfirmController.text.isEmpty)
                                          ? passwordConfirmValidate = true
                                          : passwordConfirmValidate = false;
                                      nameErrorMsg = Validate.validateName(
                                          nameController.text);
                                      emailErrorMsg = Validate.validateEmail(
                                          emailController.text);
                                      phoneErrorMsg = Validate.validatePhone(
                                          phoneController.text);
                                      passwordErrorMsg =
                                          Validate.validatePassword(
                                              passwordController.text);
                                      if (passwordErrorMsg ==
                                              "Enter a valid password" &&
                                          passwordValidate) {
                                        Validate.showAlertDialog(context,
                                            "Password must be larger than 8 chars and contain: \n At least one upper case letter \n At least one lower case letter \n At least one number \n At least one special character");
                                      }
                                      passwordConfrimErrorMsg =
                                          Validate.validateConfirmPass(
                                              passwordConfirmController.text,
                                              passwordController.text);
                                    });

                                    bool ok = (!emailValidate &&
                                        !passwordValidate &&
                                        !nameValidate &&
                                        !phoneValidate &&
                                        !passwordValidate &&
                                        !passwordConfirmValidate);
                                    if (ok) {
                                      String email = emailController.text;
                                      String password = passwordController.text;
                                      String name = nameController.text;
                                      String confirm =
                                          passwordConfirmController.text;
                                      String phone = phoneController.text;
                                      setState(() {
                                        showReload = true;
                                      });
                                      List<String> response =
                                          await Auth.Student_signUp(email,
                                              password, name, phone, confirm);
                                      setState(() {
                                        showReload = false;
                                      });
                                      if (response[1] == "200") {
                                        final snackBar = SnackBar(
                                          duration:  const Duration(milliseconds: 20000),
                                          content: Text(
                                              'Success! check your email to be able to login'),
                                          action: SnackBarAction(
                                            label: 'OK',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                        );

                                        // Find the ScaffoldMessenger in the widget tree
                                        // and use it to show a SnackBar.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Login_Desktop("student")),
                                        );
                                      } else {
                                        Validate.showAlertDialog(context,
                                            "Oh Oh \n please make sure you've entered valid data or try again \n Thank you!");
                                      }
                                    }
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      );
        },/////////////////
      )
    );
  }
}
//validation functions
