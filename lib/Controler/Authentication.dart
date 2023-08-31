import 'dart:convert' show json, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'LogicLogin.dart';

//Consultar en una peticion de login al servidor
Future<String?> login(String email, String password) async {

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(Uri.parse('http://solas.com.co:8015/facade/login'),headers: headers,body:jsonEncode({
    "email":email,
    "password":password
  }));

  var datauser = json.decode(response.body);

  if (datauser.containsKey("token")) {
    final roleId = datauser['user']['roleId']['id']; // Obtener roleId del usuario
    final status = datauser['user']['status']['id']; // validar el estatus del usuario si esta en 7 
    if (roleId == 13 && status == 7) {
      //Verifica si exite un mensaje guardado
      SharedPreferences prefs = await SharedPreferences.getInstance();
      LogicLogin.saveTokenAndUserData(datauser);
      final userResponse = prefs.getString('userResponse');
      if (userResponse != null) {
        // Redirigir al usuario a la página de inicio del conductor si tiene datos guardados
        Navigator.pushReplacementNamed(BuildContext as BuildContext, '/HomeDriver');
      }
    }
    return response.statusCode.toString(); // retorna el valor del servidor
  }else if (datauser.containsKey("violations")) {
    return "Credenciales invalidas";
  }else{
    return "Error en la solicitud: ${response.reasonPhrase}"; // Devuelve el mensaje de error
  }
}