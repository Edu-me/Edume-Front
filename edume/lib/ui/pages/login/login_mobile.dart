import 'dart:convert';

import 'package:edume/shared/auth.dart';
import 'package:edume/shared/validate.dart';
import 'package:edume/ui/pages/home_screen/home.dart';
import 'package:edume/ui/pages/student_signup/student_signup_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login_Mobile extends StatefulWidget {
  final String role;
  Login_Mobile(this.role);
  @override
  _Login_MobileState createState() => _Login_MobileState(this.role);
}

class _Login_MobileState extends State<Login_Mobile> {

  final String role;
  _Login_MobileState(this.role);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool emailValidate = false;
  bool passwordValidate = false;

  String emailErrorMsg = "";
  String passwordErrorMsg = "";
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: deviceType == DeviceScreenType.desktop? BoxFit.fill : BoxFit.cover)),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: new Center(
                    child: new Container(
                      width: (MediaQuery.of(context).size.width),
                      height: (MediaQuery.of(context).size.height),
                      color: Colors.black.withOpacity(0.7),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome Back!',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white
                            ),
                          ),

                          Padding(
                              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: emailController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  errorText: emailValidate
                                      ? emailErrorMsg
                                      : null,
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                                  prefixIcon: Padding(
                                    padding:
                                    const EdgeInsets.only(right: 15.0, left: 15, top: 15, bottom: 15),
                                    child: Icon(Icons.email),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )
                          ),

                          /////////////////////////////////////
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: passwordController,
                                cursorColor: Colors.black,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  errorText: passwordValidate
                                      ? passwordErrorMsg
                                      : null,
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(25.7),
                                      borderSide: new BorderSide(width: 0.0, style: BorderStyle.none)),
                                  contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                                  prefixIcon: Padding(
                                    padding:
                                    const EdgeInsets.only(right: 15.0, left: 15, top: 15, bottom: 15),
                                    child: Icon(Icons.email),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: RaisedButton(

                                  focusColor: Colors.blueAccent,
                                  padding: EdgeInsets.all(25),
                                  hoverColor: Colors.lightBlue,
                                  onPressed: () {
                                    setState(() async{
                                      (emailController.text.isEmpty) ? emailValidate = true : emailValidate = false;
                                      (passwordController.text.isEmpty) ? passwordValidate = true : passwordValidate = false;
                                      emailErrorMsg = Validate.validateEmail(emailController.text);
                                      passwordErrorMsg = Validate.validatePassword(passwordController.text);
                                      if(passwordErrorMsg == "Enter a valid password" && passwordValidate)
                                      {
                                        Validate.showAlertDialog(context, "Password must be larger than 8 chars and contain: \n At least one upper case letter \n At least one lower case letter \n At least one number\n At least one special character");
                                      }
                                      if(!emailValidate && !passwordValidate){
                                        String email = emailController.text;
                                        String password = passwordController.text;
                                        List<String> response = await Auth.login(email,password, this.role);
                                        if(response[1]=="200"){

                                          final SharedPreferences shPr = await SharedPreferences.getInstance();
                                          shPr.setString("email", email);
                                          shPr.setString("password", password);
                                          Map<String, dynamic> user = jsonDecode(response[0]);
                                          shPr.setString("name", user["name"]);
                                          shPr.setString("token", user["_id"]);
                                          shPr.setString("role", this.role);
                                          Auth.user = true;
                                          this.role == "admin"?shPr.setString("phone", null): shPr.setString("phone", user["phoneNumber"]);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => Home(this.role)),
                                          );
                                        }else{
                                          Validate.showAlertDialog(context, "User Not Found \n please make sure you're registered, you verified your email  or try again \n Thank you!");
                                        }

                                      }

                                    });
                                  },
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(fontSize: 25),
                                  )),
                            ),
                          ),
                            role =='student'?
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: RaisedButton(
                                    focusColor: Colors.blueAccent,
                                    padding: EdgeInsets.all(25),
                                    hoverColor: Colors.lightBlue,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => StudentSignUpMobile()),
                                      );
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(fontSize: 25),
                                    )),
                              ),
                            ) : Container(),

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
  }
}
