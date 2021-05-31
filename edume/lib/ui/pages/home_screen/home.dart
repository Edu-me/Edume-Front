import 'package:edume/ui/pages/home_screen/student_main.dart';
import 'package:flutter/material.dart';

import '../Admin.dart';

class Home extends StatelessWidget {
  final role;
  Home(this.role);
  @override
  Widget build(BuildContext context) {
    if (role == 'student') {
      return new student_main();
    } else if (role == 'teacher') {
      return new student_main();
    } else {
      return new Admin();
    }
  }
}
