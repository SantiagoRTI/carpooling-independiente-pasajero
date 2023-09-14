// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'pages/HomePassenger.dart';
import 'pages/LoginPassenger.dart';


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
        "/HomePassenger":(BuildContext context)=>   HomePassenger(),
        "/LoginPage":(BuildContext context)=>  LoginPage()
      },
    );
  }
}