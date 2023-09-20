// ignore_for_file: avoid_print, file_names
import 'package:flutter/material.dart';
import 'package:caarpoling_independiente/controler/LogicLogin.dart';
import 'package:caarpoling_independiente/widgets/LoadingWidget.dart';
import 'package:caarpoling_independiente/Controler/authentication.dart';
import '../controler/LogicHome.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  bool _isObscure = true;
  bool isLoading = false;

  //Notificacion de error
  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    LogicLogin.showErrorSnackBar(context, errorMessage);
  }

  //Autentificacion del usuario y conexion al servidor 
  Future<void> _login() async {
    final result = await login(controllerUser.text, controllerPass.text);
    if ( result == "200"){
      // ignore: use_build_context_synchronously
      await RoutesUrbanization();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/HomePassenger');
    }else if(result == null){
      // ignore: use_build_context_synchronously
      _showErrorSnackBar(context, "Credenciales invalidas");
    }
    else {
      // ignore: use_build_context_synchronously
      _showErrorSnackBar(context, result);
    }
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
                Container(height: 30,),
                Center(
                  child: Container( //contenedor que contiene el logo
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/logo_passenger.png",))
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
                  margin: const EdgeInsets.all(20),
                  child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 15,),    
                  color: const Color.fromRGBO(190, 30, 45, 1),
                  child: const Text("Ingresar", 
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await _login();
                      setState(() {
                        isLoading = false;
                      });
                    },
                )
                ),
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