import 'package:cesc/screen/BuatInfo.dart';
import 'package:cesc/screen/BuatAgenda.dart';
import 'package:cesc/screen/DetailAgenda.dart';
import 'package:cesc/screen/DetailInfo.dart';
import 'package:cesc/screen/HalAgendaUser.dart';
import 'package:cesc/screen/HalamanInfo.dart';
import 'package:cesc/screen/HalamanProfil.dart';
import 'package:cesc/screen/Kalender.dart';
import 'package:cesc/screen/Notification.dart';
import 'package:cesc/screen/PassAdmin.dart';
import 'package:cesc/screen/dashboard.dart';
import 'package:cesc/screen/login.dart';
import 'package:cesc/screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Splashscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}
