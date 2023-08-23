import 'package:caarpoling_independiente/pages/LoginDriver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDriver extends StatefulWidget {
  const HomeDriver({super.key});

  @override
  State<HomeDriver> createState() => _HomeDriverState();
}

class _HomeDriverState extends State<HomeDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Bienvenido"),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 119, vertical: 15,),    
              color: const Color.fromRGBO(190, 30, 45, 1),
              child: const Text("Cerrar aplicacion ", style: TextStyle(color: Colors.white),),
              onPressed: () async {
              // ignore: use_build_context_synchronously
              SystemNavigator.pop(); //Cierra la aplicacion
              },
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15,),    
              color: const Color.fromRGBO(190, 30, 45, 1),
              child: const Text("Cerrar sesion ", style: TextStyle(color: Colors.white),),
              onPressed: () async {
               SharedPreferences prefs = await SharedPreferences.getInstance();
               await prefs.clear(); // Elimina todos los datos almacenados
              // ignore: use_build_context_synchronously
              Navigator.push(context,
              MaterialPageRoute(builder: (context)=> const LoginPage())
              );
              },)
          ],
        ),
      )
    );
  }
}