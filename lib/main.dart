// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'pages/HomeDriver.dart';
import 'pages/LoginDriver.dart';


void main() => runApp( MiApp());

class MiApp extends StatelessWidget {
   MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Carpooling indenpendiente",
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{
        "/HomeDriver":(BuildContext context)=>   HomeDriver(),
        "/LoginPage":(BuildContext context)=>  LoginPage()
      },
    );
  }
}