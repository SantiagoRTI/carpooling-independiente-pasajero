// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:caarpoling_independiente/controler/LogicHome.dart';

class HomePassenger extends StatefulWidget {
  const HomePassenger({super.key});
  @override
  State<HomePassenger> createState() => _HomePassengerState();
}

class _HomePassengerState extends State<HomePassenger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 119, vertical: 15,),    
              color: const Color.fromRGBO(190, 30, 45, 1),
              child: const Text("Consulta ", style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await(RoutesUrbanization());                
              },
            ),
          ],
        ),
      )
    );
  }
}

// ignore: non_constant_identifier_names


// const Text("Bienvenido"),
            
            // MaterialButton(
            //   padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 15,),    
            //   color: const Color.fromRGBO(190, 30, 45, 1),
            //   child: const Text("Cerrar sesion ", style: TextStyle(color: Colors.white),),
            //   onPressed: () async {
            //    SharedPreferences prefs = await SharedPreferences.getInstance();
            //    await prefs.clear(); // Elimina todos los datos almacenados
            //   // ignore: use_build_context_synchronously
            //   Navigator.push(context,
            //   MaterialPageRoute(builder: (context)=> const LoginPage())
            //     );
            //   },
            // )