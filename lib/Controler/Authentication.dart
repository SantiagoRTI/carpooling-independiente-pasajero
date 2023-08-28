import 'dart:convert';
import 'package:caarpoling_independiente/pages/HomeDriver.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import '../pages/LoginDriver.dart';
import 'LogicLogin.dart';

  //Variable del mensaje
  String? message = "";

  //Notificacion de error
  void _showErrorSnackBar(BuildContext context, String errorMessage) {
  LogicLogin.showErrorSnackBar(context, errorMessage);
  }

  //Consultar en una peticion de login al servidor
  Future<void> login(String email, String password) async {
    
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(Uri.parse('http://solas.com.co:8015/facade/login'),headers: headers,body:jsonEncode({
    "email":email,
    "password":password
  }));
  
  print("respuesta ${response.body}");

  var datauser = json.decode(response.body);

  if (datauser.containsKey("token")) {
    final roleId = datauser['user']['roleId']['id']; // Obtener roleId del usuario
    final status = datauser['user']['status']['id']; // validar el estatus del usuario si esta en 7 
    if (roleId == 13 && status == 7) {
      //Verifica si exite un mensaje guardado
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userResponse = prefs.getString('userResponse');
      (BuildContext context)=>   const LoginPage();
      if (userResponse != null) {
        // Redirigir al usuario a la página de inicio del conductor
        // ignore: use_build_context_synchronously
        (BuildContext context)=>   const HomeDriver();
      }
    }else {
      setState((){
      message = "Credenciales inválidas";
    });
    _showErrorSnackBar(BuildContext as BuildContext, "Mensaje de error");
    }
    LogicLogin.saveTokenAndUserData(datauser);
  }else if (datauser.containsKey("violations" )) {
    var violations = datauser["violations"] as List;
    var errorMessages = violations.map((violation) => violation["message"]).toList();
    setState(() {
      message = errorMessages.join('\n'); // Unir mensajes con saltos de línea
    });
    _showErrorSnackBar(BuildContext as BuildContext, errorMessages.join('\n'));
    }else {
    setState(() {
      message = "Error en la solicitud: ${response.reasonPhrase}";
    });
    _showErrorSnackBar(BuildContext as BuildContext, "Error en la solicitud: ${response.reasonPhrase}");
    }
  }