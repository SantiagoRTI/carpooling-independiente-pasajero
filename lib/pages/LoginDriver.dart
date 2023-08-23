// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:caarpoling_independiente/Controler/LogicLogin.dart';
import 'package:caarpoling_independiente/Controler/WidgetControler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  String? message = "";

  bool _isObscure = true;

  bool isLoading = false;

  //Consultar en una peticion de login al servidor
  Future<void> login() async {
    
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final response = await http.post(Uri.parse('http://solas.com.co:8015/facade/login'),headers: headers,body:jsonEncode({
    "email": controllerUser.text,
    "password": controllerPass.text 
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
        Navigator.pushReplacementNamed(context, '/HomeDriver');
      }
    }else {
      setState(() {
      message = "Credenciales inválidas";
    });  
    _showErrorSnackBar("Credenciales inválidas");
    }
    LogicLogin.saveTokenAndUserData(datauser);
  } else if (datauser.containsKey("violations" )) {
    var violations = datauser["violations"] as List;
    var errorMessages = violations.map((violation) => violation["message"]).toList();
    setState(() {
      message = errorMessages.join('\n'); // Unir mensajes con saltos de línea
    });
    _showErrorSnackBar(errorMessages.join('\n'));
    }else {
      setState(() {
        message = "Error en la solicitud: ${response.reasonPhrase}";
      });
      _showErrorSnackBar("Error en la solicitud: ${response.reasonPhrase}");
    }
  }


  //Notificacion error local
  void _showErrorSnackBar(String errorMessage) {
    LogicLogin.showErrorSnackBar(context, errorMessage);
  }

  //Carga de datos del usuario guardado
  @override
  void initState() {
    super.initState();
    LogicLogin.loadUser(context);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold( ///////// Interfas del login /////////////
      appBar: AppBar(title: const Center(child: Text("Version 1.0.0", style: TextStyle(color: Colors.black, fontSize: 24),)),
       backgroundColor: Colors.transparent, 
        elevation: 0.0, ),
      body: SingleChildScrollView( 
        child: Center(
        child: Stack(
          children: [
            Column( //Widgets la pantalla de login
              children: <Widget>[
                Center(
                  child: Container( //contenedor que contiene el logo
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/logo_conductor.png",))
                  )),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text (
                  "Iniciar Sesión",style:TextStyle( // Un texto que contiene Sing in y el cual le ponemos estilo con style: TextStyle()
                  color: Color.fromARGB(255, 0, 0, 0), //color de texto 
                  fontSize: 30.0, //Tamaño de texto
                  fontWeight: FontWeight.bold) //El tipo de letra de texto
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child:  TextField(
                  controller: controllerUser,
                  decoration: const InputDecoration(
                  icon: Icon(Icons.alternate_email_rounded),
                  hintText: 'example@email.com'
                  ))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12), 
                  child: TextFormField(
                  obscureText: _isObscure,
                  controller: controllerPass,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                  icon: const Icon(Icons.lock_outlined),
                  hintText: '********',             
                  suffixIcon: IconButton( //icono de ocultar la contraseña 
                  icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                  setState(() {
                  _isObscure = !_isObscure;
                  });},),),)),
                Container(
                  margin: const EdgeInsets.all(22),
                  child: MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15,),    
                  color: const Color.fromRGBO(190, 30, 45, 1),
                  child: const Text("Ingresar", 
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await login();                      
                      setState(() {
                        isLoading = false;
                      });
                    },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),   
                )),
              ],
            ),
            if (isLoading) const Flexible(child: LoadingWidget()),
          ],
        ),
       )
      )
    );
  } 
}