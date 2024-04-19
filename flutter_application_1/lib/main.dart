import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/tela1.dart';
import 'package:flutter_application_1/tela2.dart';
import 'package:flutter_application_1/tela3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/tela1',
      routes: {
        '/tela1': (context) => TelaUm(),
        '/tela2': (context) => TelaDois(),
        '/tela3': (context) => TelaTres(),
      },
    );
  }
}