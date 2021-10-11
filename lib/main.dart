import 'package:cesc/screen/BuatInfo.dart';
import 'package:cesc/screen/BuatAgenda.dart';
import 'package:cesc/screen/DetailAgenda.dart';
import 'package:cesc/screen/DetailInfo.dart';
import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:cesc/screen/HalInfo.dart';
import 'package:cesc/screen/Kalender.dart';
import 'package:cesc/screen/PassAdmin.dart';
import 'package:cesc/screen/PassUser.dart';
import 'package:cesc/screen/Profil.dart';
import 'package:cesc/screen/login.dart';
import 'package:cesc/screen/signup.dart';
import 'package:flutter/material.dart';
import 'Splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalInfo(),
    );
  }
}
