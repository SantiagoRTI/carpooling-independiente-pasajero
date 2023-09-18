import 'package:caarpoling_independiente/controler/class/reques_response.dart';
import 'package:caarpoling_independiente/widgets/widgetsHome.dart';
import 'package:flutter/material.dart';
import 'package:caarpoling_independiente/controler/LogicHome.dart';

// ignore: must_be_immutable
class HomePassenger extends StatelessWidget {
  HomePassenger({super.key});

  var refreshKey=GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rutas asociadas a la urbanizacion")),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: Center(
          child: FutureBuilder<List<RoutesUrban>>(
            future: RoutesUrbanization(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final routes = snapshot.data!;
                return buildRoutes(routes);
              } else {
                return const Text("No hay rutas por ahora");
              }
            },
          ),
        ),
      ),
    );
  }
  Future<void> refreshList() async{
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 1));
    
  }
}



//
// ignore: non_constant_identifier_names


// List<RoutesUrban>? routes = await RoutesUrbanization();
                  // if (routes != null && routes.isNotEmpty) {
                  //   String finalAddress = routes[0].description; // Obtén el "finalAddress" del primer elemento
                  //   print('Final Address: $finalAddress');
                  // } else {
                  //   print('La respuesta es nula o la lista está vacía'); // Maneja los casos en que la respuesta sea nula o la lista esté vacía (error).
                  // }

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

            