import 'package:edume/shared/auth.dart';
import 'package:edume/shared/validate.dart';
import 'package:edume/ui/pages/login/login_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
class StudentSignUpMobile extends StatefulWidget {
  @override
  _StudentSignUpMobileState createState() => _StudentSignUpMobileState();
}

class _StudentSignUpMobileState extends State<StudentSignUpMobile> {
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

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    return  Scaffold(
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
                      width: (MediaQuery.of(context).size.width)/1.1,
                      height: (MediaQuery.of(context).size.height) * 1.2,
                      color: Colors.black.withOpacity(0.7),
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Join Us',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white
                            ),
                          ),

                          Padding(
                              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: nameController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                  errorText: nameValidate
                                      ? nameErrorMsg
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
                                    child: Icon(Icons.person),
                                  ),
                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
                                ),
                              )
                          ),
                          //////////////////////////
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

                          /////////////////////////////////
                          Padding(
                              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: phoneController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: "Phone number",
                                  errorText: phoneValidate
                                      ? phoneErrorMsg
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
                                    child: Icon(Icons.phone_android),
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
                              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                              child: TextFormField(
                                controller: passwordConfirmController,
                                cursorColor: Colors.black,
                                obscureText: true,
                                obscuringCharacter: "*",
                                decoration: InputDecoration(
                                  hintText: "Confirm Password",
                                  errorText: passwordConfirmValidate
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
                                  onPressed: () async{
                                    setState(() {
                                      (nameController.text.isEmpty)  ? nameValidate = true : nameValidate = false;
                                      (emailController.text.isEmpty || !(emailController.text.contains("@",0)) || !(emailController.text.contains(".com",0) || emailController.text.contains(".net",0))) ? emailValidate = true : emailValidate = false;
                                      (phoneController.text.isEmpty || !(phoneController.text.contains(new RegExp("^01[0-2]{1}[0-9]{8}"),0))) ? phoneValidate = true : phoneValidate = false;
                                      (passwordController.text.isEmpty || !Validate.isPasswordCompliant(passwordController.text)) ? passwordValidate = true : passwordValidate = false;
                                      (passwordConfirmController.text.isEmpty) ? passwordConfirmValidate = true : passwordConfirmValidate = false;
                                      nameErrorMsg = Validate.validateName(nameController.text);
                                      emailErrorMsg = Validate.validateEmail(emailController.text);
                                      phoneErrorMsg = Validate.validatePhone(phoneController.text);
                                      passwordErrorMsg = Validate.validatePassword(passwordController.text);
                                      if(passwordErrorMsg == "Enter a valid password" && passwordValidate)
                                      {
                                        Validate.showAlertDialog(context, "Password must be larger than 8 chars and contain: \n At least one upper case letter \n At least one lower case letter \n At least one number\n At least one special character");
                                      }
                                      passwordConfrimErrorMsg = Validate.validateConfirmPass(passwordConfirmController.text, passwordController.text);
                                    });

                                    bool ok = (!emailValidate && !passwordValidate && !nameValidate && !phoneValidate && !passwordValidate && !passwordConfirmValidate);
                                    if(ok ) {
                                      String email = emailController.text;
                                      String password = passwordController.text;
                                      String name = nameController.text;
                                      String confirm = passwordConfirmController
                                          .text;
                                      String phone = phoneController.text;
                                      List<String> response = await Auth
                                          .Student_signUp(
                                          email, password, name, phone,
                                          confirm);
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
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                            Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Login_Mobile("student")),
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
  }
}

