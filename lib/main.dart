import 'package:cesc/screen/BuatAgenda.dart';
import 'package:cesc/screen/PassAdmin.dart';
import 'package:cesc/screen/PassUser.dart';
import 'package:cesc/screen/login.dart';
import 'package:cesc/screen/signup.dart';
import 'package:flutter/material.dart';
import 'Splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
