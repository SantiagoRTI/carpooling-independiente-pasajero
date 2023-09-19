import 'package:caarpoling_independiente/controler/class/reques_response.dart';
import 'package:caarpoling_independiente/widgets/LoadingWidget.dart';
import 'package:caarpoling_independiente/widgets/widgetsHome.dart';
import 'package:flutter/material.dart';
import 'package:caarpoling_independiente/controler/LogicHome.dart';

class HomePassenger extends StatelessWidget {
  HomePassenger({super.key});

  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(190, 30, 45, 1),
        title: const Text("Rutas asociadas a la urbanización")
      
      ),
      body: Center(child: Refresh()),
    );
  }
}

class Refresh extends StatelessWidget {
  Refresh({
    super.key,
  });

  final ValueNotifier<int> _refreshNotifier = ValueNotifier<int>(0);

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _refreshNotifier.value++; // Incrementa el valor del notificador para forzar la actualización
  }

  @override
  Widget build(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: _onRefresh,
      child: ValueListenableBuilder<int>(
        valueListenable: _refreshNotifier,
        builder: (context,_, __) {
          return FutureBuilder<List<RoutesUrban>>(
            future: RoutesUrbanization(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Flexible(child: LoadingWidget());
              } else if (snapshot.hasData) {
                final routes = snapshot.data!;
                return buildRoutes(routes);
              } else {
                return const Text("No hay rutas por ahora");
              }
            },
          );
        },
      ),
    );
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

            