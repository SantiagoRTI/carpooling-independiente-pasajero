import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LogicLogin{

  // Funcion para mostrar la notificacion de error
  static void showErrorSnackBar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100),
    content: Container(
      width: 10,
      decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(100))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SizedBox(width: 5), 
              Text(
                'Error',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),),],),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),],),
    ),
    duration: const Duration(seconds: 4), // Ajustar la duración del SnackBar
    backgroundColor:  Colors.transparent
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Guardar mensaje de respuesta 
  static Future<void> saveTokenAndUserData(Map<String, dynamic> data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userResponse', jsonEncode(data)); // Guardar el mensaje y datos en SharedPreferences
  String? token = data['token'];
  if (token != null) {
    prefs.setString('userToken', token); // Guardar el token en SharedPreferences
  }
  }
 
  //Cargar el mensaje del usuario
  static Future<void> loadUser(BuildContext context) async { 
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final userToken = prefs.getString('userToken');
  if (userToken != null && userToken.isNotEmpty) {
    // Verificar si existe un mensaje de respuesta guardado
    final userResponse = prefs.getString('userResponse');
    if (userResponse != null) {
      // Redirigir al usuario a la página de inicio del conductor
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/HomeDriver');
      }
    }
  }
}