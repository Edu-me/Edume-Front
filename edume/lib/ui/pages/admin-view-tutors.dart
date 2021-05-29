//import 'package:flutter/material.dart';
//import 'package:responsive_builder/responsive_builder.dart';
//class ViewTutors extends StatefulWidget {
//  @override
//  _ViewTutorsState createState() => _ViewTutorsState();
//}
//
//class _ViewTutorsState extends State<ViewTutors> {
//  @override
//  Widget build(BuildContext context) {
//    var deviceType = getDeviceType(MediaQuery.of(context).size);
//
//    return Scaffold(
//      appBar: PreferredSize(
//
//        preferredSize: Size.fromHeight(75.0),
//        child: AppBar(
//          title: Row(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: [
//              Image.asset(
//                'assets/logo9.png',
//                fit: BoxFit.contain,
//                height: 40,
//                width: 50,
//              ),
//              Container(
//                  padding: const EdgeInsets.all(8.0), child: Text('Edume'))
//            ],
//          ),
//          backgroundColor: Colors.black,
//        ),
//      ),
//      /////////////////
//
//
//      ///////////////////
//      body: Container(
//        constraints: BoxConstraints.expand(),
//        decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage("assets/background.jpg"),
//                fit: deviceType == DeviceScreenType.desktop
//                    ? BoxFit.fill
//                    : BoxFit.cover)),
//
//        child: new SingleChildScrollView(
//          child: new Center(
//            child: new Column(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
//                  child: new Center(
//                    child: new Container(
//                      width: deviceType == DeviceScreenType.desktop? (MediaQuery.of(context).size.width) / 2: (MediaQuery.of(context).size.width) / 1.1,
//                      height: (MediaQuery.of(context).size.height) * 1.2,
//                      color: Colors.black.withOpacity(0),
//                      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
//                      child: new Column(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: [
//                          Text(
//                            'Add Tutor!',
//                            style: TextStyle(fontSize: deviceType == DeviceScreenType.desktop? 50 : 30, color: Colors.white),
//                          ),
//
//                          //Name input field///////////////////
//                          Padding(
//                              padding: const EdgeInsets.all(30.0),
//                              child: TextFormField(
//                                cursorColor: Colors.black,
//                                controller: nameController,
//                                decoration: InputDecoration(
//                                  errorBorder: new OutlineInputBorder(
//                                    borderRadius:
//                                    new BorderRadius.circular(25.7),
//                                    borderSide: new BorderSide(
//                                        color: Colors.red, width: 0.0),
//                                  ),
//                                  errorText: nameValidate ? nameErrorMsg : null,
//                                  errorStyle: TextStyle(
//                                    color: Colors.red[400],
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 13,
//                                  ),
//                                  hintText: "Full Name",
//                                  fillColor: Colors.white,
//                                  filled: true,
//                                  border: new OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  contentPadding: EdgeInsets.fromLTRB(
//                                      10.0, 10.0, 10.0, 0.0),
//                                  prefixIcon: Padding(
//                                    padding: const EdgeInsets.only(
//                                        right: 15.0,
//                                        left: 15,
//                                        top: 15,
//                                        bottom: 15),
//                                    child: Icon(Icons.person),
//                                  ),
//                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
//                                ),
//                              )),
//                          //Email input field///////////////////
//                          Padding(
//                              padding: const EdgeInsets.fromLTRB(
//                                  30.0, 5.0, 30.0, 0.0),
//                              child: TextFormField(
//                                controller: emailController,
//                                cursorColor: Colors.black,
//                                decoration: InputDecoration(
//                                  errorBorder: new OutlineInputBorder(
//                                    borderRadius:
//                                    new BorderRadius.circular(25.7),
//                                    borderSide: new BorderSide(
//                                        color: Colors.red, width: 0.0),
//                                  ),
//                                  errorText:
//                                  emailValidate ? emailErrorMsg : null,
//                                  errorStyle: TextStyle(
//                                    color: Colors.red[400],
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 13,
//                                  ),
//                                  hintText: "Email",
//                                  fillColor: Colors.white,
//                                  filled: true,
//                                  border: new OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  contentPadding: EdgeInsets.fromLTRB(
//                                      10.0, 10.0, 10.0, 0.0),
//                                  prefixIcon: Padding(
//                                    padding: const EdgeInsets.only(
//                                        right: 15.0,
//                                        left: 15,
//                                        top: 15,
//                                        bottom: 15),
//                                    child: Icon(Icons.email),
//                                  ),
//                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
//                                ),
//                              )),
//
//                          //Number input field///////////////////
//                          Padding(
//                              padding: const EdgeInsets.fromLTRB(
//                                  30.0, 35.0, 30.0, 0.0),
//                              child: TextFormField(
//                                controller: phoneController,
//                                cursorColor: Colors.black,
//                                decoration: InputDecoration(
//                                  errorBorder: new OutlineInputBorder(
//                                    borderRadius:
//                                    new BorderRadius.circular(25.7),
//                                    borderSide: new BorderSide(
//                                        color: Colors.red, width: 0.0),
//                                  ),
//                                  errorText:
//                                  phoneValidate ? phoneErrorMsg : null,
//                                  errorStyle: TextStyle(
//                                    color: Colors.red[400],
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 13,
//                                  ),
//                                  hintText: "Phone number",
//                                  fillColor: Colors.white,
//                                  filled: true,
//                                  border: new OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0, style: BorderStyle.none)),
//                                  contentPadding: EdgeInsets.fromLTRB(
//                                      10.0, 10.0, 10.0, 0.0),
//                                  prefixIcon: Padding(
//                                    padding: const EdgeInsets.only(
//                                        right: 15.0,
//                                        left: 15,
//                                        top: 15,
//                                        bottom: 15),
//                                    child: Icon(Icons.phone_android),
//                                  ),
//                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
//                                ),
//                              )),
//                          //Password input field///////////////////
//                          Padding(
//                              padding: const EdgeInsets.fromLTRB(
//                                  30.0, 35.0, 30.0, 0.0),
//                              child: TextFormField(
//                                controller: passwordController,
//                                obscureText: true,
//                                obscuringCharacter: "*",
//                                cursorColor: Colors.black,
//                                decoration: InputDecoration(
//                                  errorBorder: new OutlineInputBorder(
//                                    borderRadius:
//                                    new BorderRadius.circular(25.7),
//                                    borderSide: new BorderSide(
//                                        color: Colors.red, width: 0.0),
//                                  ),
//                                  errorText: passwordValidate
//                                      ? passwordErrorMsg
//                                      : null,
//                                  errorStyle: TextStyle(
//                                    color: Colors.red[400],
//                                    fontWeight: FontWeight.bold,
//                                    fontSize: 13,
//                                  ),
//                                  hintText: "Password",
//                                  fillColor: Colors.white,
//                                  filled: true,
//                                  border: new OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0,
//                                          style: BorderStyle.none)),
//                                  focusedBorder: OutlineInputBorder(
//                                      borderRadius:
//                                      new BorderRadius.circular(25.7),
//                                      borderSide: new BorderSide(
//                                          width: 0.0,
//                                          style: BorderStyle.none)),
//                                  contentPadding: EdgeInsets.fromLTRB(
//                                      10.0, 10.0, 10.0, 0.0),
//                                  prefixIcon: Padding(
//                                    padding: const EdgeInsets.only(
//                                        right: 15.0,
//                                        left: 15,
//                                        top: 15,
//                                        bottom: 15),
//                                    child: Icon(Icons.vpn_key_sharp),
//                                  ),
//                                  //errorStyle: CustomTextStyle.textRegular().copyWith(color: Colors.red));,
//                                ),
//                              )),
//                          //Password input field///////////////////
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: [
//                              Text("Nationality ",
//                                style: TextStyle( fontSize: deviceType == DeviceScreenType.desktop? 30 : 20,color: Colors.orange),
//                              ),
//                              DropdownButton<String>(
//                                value: dropdownValue,
//                                elevation: 16,
//                                style:  TextStyle(fontSize:deviceType == DeviceScreenType.desktop? 30 : 20,color: Colors.orange),
//                                underline: Container(
//                                  height: 2,
//                                  color: Colors.white,
//                                ),
//                                onChanged: (String newValue) {
//                                  setState(() {
//                                    dropdownValue = newValue;
//                                  });
//                                },
//                                items: <String>['Afghan',
//                                  'Algerian',
//                                  'Algerian',
//                                  'Angolan',
//                                  'Argentine',
//                                  'Austrian',
//                                  'Australian',
//                                  'Australian',
//                                  'Bangladeshi',
//                                  'Belarusian',
//                                  'Belgian',
//                                  'Bolivian',
//                                  'Brazilian',
//                                  'British',
//                                  'Bulgarian',
//                                  'Cambodian',
//                                  'Cameroonian',
//                                  'Canadian',
//                                  'Central African',
//                                  'Chadian',
//                                  'Chinese',
//                                  'Colombian',
//                                  'Costa Rican',
//                                  'Croatian',
//                                  'Czech',
//                                  'Congolese',
//                                  'Danish',
//                                  'Ecuadorian',
//                                  'Egyptian',
//                                  'Salvadoran',
//                                  'English',
//                                  'Estonian',
//                                  'Ethiopian',
//                                  'Finnish',
//                                  'French',
//                                  'German',
//                                  'Ghanaian',
//                                  'Greek',
//                                  'Guatemalan',
//                                  'Dutch',
//                                  'Honduran',
//                                  'Hungarian',
//                                  'Icelandic',
//                                  'Indian',
//                                  'Indonesian',
//                                  'Iranian',
//                                  'Iraqi',
//                                  'Irish',
//                                  'Italian',
//                                  'Ivorian',
//                                  'Jamaican',
//                                  'Japanese',
//                                  'Jordanian',
//                                  'Kazakh',
//                                  'Kenyan',
//                                  'Libyan',
//                                  'Lithuanian',
//                                  'Malagasy',
//                                  'Malaysian',
//                                  'Malian',
//                                  'Mauritanian',
//                                  'Mexican',
//                                  'Moroccan',
//                                  'Namibian' ,
//                                  'New Zealand',
//                                  'Nicaraguan',
//                                  'Nigerien',
//                                  'Nigerian',
//                                  'Norwegian' ,
//                                  'Omani'     ,
//                                  'Pakistani' ,
//                                  'Panamanian'    ,
//                                  'Paraguayan'     ,
//                                  'Peruvian'         ,
//                                  'Philippine Polis',
//                                  'Portuguese',
//                                  'Congolese',
//                                  'Romanian',
//                                  'Russian'     ,
//                                  'Saudi',
//                                  'Saudi Arabian',
//                                  'Scottish',
//                                  'Senegalese' ,
//                                  'Serbian'     ,
//                                  'Singaporean',
//                                  'Slovak' ,
//                                  'Somalian' ,
//                                  'South African',
//                                  'Spanish' ,
//                                  'Sudanese',
//                                  'Swedish',
//                                  'Swiss' ,
//                                  'Syrian',
//                                  'Thai' ,
//                                  'Tunisian' ,
//                                  'Turkish' ,
//                                  'Turkmen' ,
//                                  'Ukranian',
//                                  'Emirati' ,
//                                  'American',
//                                  'Uruguayan',
//                                  'Vietnamese',
//                                  'Welsh',
//                                  'Zambian',
//                                  'Zimbabwean']
//                                    .map<DropdownMenuItem<String>>((String value) {
//                                  return DropdownMenuItem<String>(
//                                    value: value,
//                                    child: Text(value),
//                                  );
//                                }).toList(),
//                              ),
//                            ],
//                          ),
//                          /////////////Login button/////////////////
//                          Padding(
//                            padding: const EdgeInsets.all(20.0),
//                            child: ClipRRect(
//                              borderRadius: BorderRadius.circular(40),
//                              child: RaisedButton(
//                                  focusColor: Colors.blueAccent,
//                                  padding: EdgeInsets.all(25),
//                                  hoverColor: Colors.lightBlue,
//                                  onPressed: () async {
//                                    setState(() {
//                                      (nameController.text.isEmpty)
//                                          ? nameValidate = true
//                                          : nameValidate = false;
//                                      (emailController.text.isEmpty ||
//                                          !(emailController.text
//                                              .contains("@", 0)) ||
//                                          !(emailController.text
//                                              .contains(".com", 0) ||
//                                              emailController.text
//                                                  .contains(".net", 0)))
//                                          ? emailValidate = true
//                                          : emailValidate = false;
//                                      (phoneController.text.isEmpty ||
//                                          !(phoneController.text.contains(
//                                              new RegExp(
//                                                  "^01[0-2]{1}[0-9]{8}"),
//                                              0)))
//                                          ? phoneValidate = true
//                                          : phoneValidate = false;
//                                      (passwordController.text.isEmpty ||
//                                          !Validate.isPasswordCompliant(
//                                              passwordController.text))
//                                          ? passwordValidate = true
//                                          : passwordValidate = false;
//                                      nameErrorMsg = Validate.validateName(
//                                          nameController.text);
//                                      emailErrorMsg = Validate.validateEmail(
//                                          emailController.text);
//                                      phoneErrorMsg = Validate.validatePhone(
//                                          phoneController.text);
//                                      passwordErrorMsg =
//                                          Validate.validatePassword(
//                                              passwordController.text);
//                                      if (passwordErrorMsg ==
//                                          "Enter a valid password" &&
//                                          passwordValidate) {
//                                        Validate.showAlertDialog(context,
//                                            "Password must be larger than 8 chars and contain: \n At least one upper case letter \n At least one lower case letter \n At least one number \n At least one special character");
//                                      }
//
//                                    });
//
//                                    bool ok = (!emailValidate &&
//                                        !passwordValidate &&
//                                        !nameValidate &&
//                                        !phoneValidate &&
//                                        !passwordValidate );
//                                    if (ok) {
//                                      String email = emailController.text;
//                                      String password = passwordController.text;
//                                      String name = nameController.text;
//                                      String confirm =
//                                          passwordController.text;
//                                      String phone = phoneController.text;
//                                      List<String> response =
//                                      await Auth.Tutor_Signup(email,
//                                          password, name, phone, confirm, dropdownValue);
//                                      if (response[1] == "200") {
//                                        nameController.text = "";
//                                        emailController.text = "";
//                                        passwordController.text = "";
//                                        phoneController.text = "";
//                                        dropdownValue = "Egyptian";
//                                        final snackBar = SnackBar(
//                                          duration:  const Duration(milliseconds: 20000),
//                                          content: Text(
//                                              'Success! Tutor is added'),
//                                          action: SnackBarAction(
//                                            label: 'OK',
//                                            onPressed: () {
//                                              // Some code to undo the change.
//                                            },
//                                          ),
//                                          behavior: SnackBarBehavior.floating,
//                                          shape: RoundedRectangleBorder(
//                                            borderRadius: BorderRadius.circular(10.0),
//                                          ),
//                                        );
//                                        // Find the ScaffoldMessenger in the widget tree
//                                        // and use it to show a SnackBar.
//                                        ScaffoldMessenger.of(context)
//                                            .showSnackBar(snackBar);
//
//                                      } else {
//                                        Validate.showAlertDialog(context,
//                                            "Oh Oh \n please make sure you've entered valid data or try again \n Thank you!");
//                                      }
//                                    }
//                                  },
//                                  child: Text(
//                                    "Add",
//                                    style: TextStyle(fontSize: 25),
//                                  )),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//
//      drawer: Drawer(
//        child: ListView(
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//
//            Container(
//              height: 80.0,
//              child: DrawerHeader(
//                child: Text('Edume',
//
//                    style: TextStyle(
//                        color: Colors.teal,
//                        fontWeight: FontWeight.bold,
//                        fontSize: 35)
//                ),
//                decoration: BoxDecoration(
//                  color: Colors.black,
//                ),
//              ),
//            ),
//            ListTile(
//              leading: CircleAvatar(
//                backgroundImage: AssetImage("assets/register.jpg"),
//              ),
//              title: Text('Register a tutor'),
//              onTap: () {
//                Navigator.pop(context);
//
//              },
//            ),
//            ListTile(
//              leading: CircleAvatar(
//                backgroundImage: AssetImage("assets/tutor.png"),
//              ),
//              title: Text('Tutors'),
//              onTap: () {
//                Navigator.pop(context);
//                // ...
//              },
//            ),
//            ListTile(
//              leading: CircleAvatar(
//                backgroundImage: AssetImage("assets/students.jpg"),
//              ),
//              title: Text('Students'),
//              onTap: () {
//                Navigator.pop(context);
//                // ...
//              },
//            ),
//            ListTile(
//              leading: CircleAvatar(
//                backgroundImage: AssetImage("assets/logout.jpg"),
//              ),
//              title: Text('LogOut'),
//              onTap: () {
//                Navigator.pop(context);
//                // ...
//              },
//            ),
//          ],
//        ),
//
//      ),
//    );
//  }
//}
