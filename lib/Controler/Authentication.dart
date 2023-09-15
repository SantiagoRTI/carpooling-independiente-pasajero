// ignore: file_names
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

  final response = await http.post(
    Uri.parse('http://solas.com.co:8015/facade/login'),
    headers: headers,body:jsonEncode({
      "email": email,
      "password": password
      }
    ) 
  );

  var datauser = json.decode(response.body);
  final token = datauser['token'];
  final user = datauser['user'];

  
  if (user != null && user.containsKey('roleId') && user.containsKey('status')) {
    
    final roleId = user['roleId']['id']; // Obtener roleId del usuario 
    final status = user['status']['id']; // validar el estatus del usuario si esta en 7
    final idUser = user['id'];
    final userRol = datauser['user']['roleId'];

    if (roleId == 136 && status == 7) {
      String jsonUser = jsonEncode(user);
      String jsonUserRol = jsonEncode(userRol);
      await LogicLogin.saveUser(jsonUser);
      await LogicLogin.saveUserRol(jsonUserRol);
      await LogicLogin.saveTokenUser(token);

      await getUrbanizationIdUser(idUser, token);
      
      // Verifica si existe un mensaje guardado
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // final userResponse = prefs.getString('userToken');
      // if (userResponse != null) {
      // // Redirigir al usuario a la página de inicio del conductor si tiene datos guardados
      //   Navigator.pushReplacementNamed(BuildContext as BuildContext, '/HomePassenger');
      // }
      return "200"; // Retorna el valor del servidor
    } else {
      return null; // Acceso denegado
    }
  }else{
    return null;    
  }
}


Future<String?> getUrbanizationIdUser(int id, String token ) async { 

  Map<String, String> headers ={
    'Content-Type': 'application/json',
    'Authorization': token
  };

  final responsePassegerUrbanization = await http.get(
  headers: headers,
  Uri.parse('http://solas.com.co:8015/facade/get-independent/passenger/user/$id'),
  );
  
  if (responsePassegerUrbanization.statusCode == 200) {
    var urbanizationReponse = json.decode(responsePassegerUrbanization.body);
    final urbanizationData = urbanizationReponse['urbanization'];    
    
    String urbanizacionJson = jsonEncode(urbanizationData);
    LogicLogin.saveUrbanization(urbanizacionJson);
    
  } else {
    return null;
  }
  return null;
}