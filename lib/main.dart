// ignore_for_file: sort_child_properties_last
import 'package:caarpoling_independiente/pages/InfoService.dart';
import 'package:caarpoling_independiente/pages/RoutesService.dart';
import 'package:flutter/material.dart';
import 'pages/HomePassenger.dart';
import 'pages/LoginPassenger.dart';

void main() => runApp( MiApp());

class MiApp extends StatelessWidget {
   // ignore: prefer_const_constructors_in_immutables
   MiApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Carpooling indenpendiente",
      home: const LoginPage(),
      routes: <String, WidgetBuilder>{ //Lista de rutas de la aplicacion
        "/LoginPage":(BuildContext context)=>  LoginPage(),
        "/HomePassenger":(BuildContext context)=>   HomePassenger(),
        "/RoutesInfo":(BuildContext context)=>  Detailroute(),
        "/InfoService":(BuildContext context)=>  InfoService()
      },
    );
  }
}