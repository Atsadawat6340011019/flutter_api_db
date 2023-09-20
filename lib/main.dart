import 'package:flutter/material.dart';
import 'package:rest_api/home.dart';
import 'package:rest_api/login.dart';
import 'package:rest_api/login2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Login2(),
    );
  }
}

