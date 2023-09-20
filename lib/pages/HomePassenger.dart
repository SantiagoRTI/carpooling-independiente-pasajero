import 'package:caarpoling_independiente/controler/class/RequesrResponseRoutesUrban.dart';
import 'package:caarpoling_independiente/widgets/LoadingWidget.dart';
import 'package:caarpoling_independiente/widgets/widgetsHome.dart';
import 'package:flutter/material.dart';
import 'package:caarpoling_independiente/controler/LogicHome.dart';

//Home del pasajero
class HomePassenger extends StatelessWidget { 
  const HomePassenger({super.key});

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

class Refresh extends StatelessWidget { //clase de para refrescar la pagina 
  Refresh({
    super.key,
  });

  final ValueNotifier<int> _refreshNotifier = ValueNotifier<int>(0); //variable para la recarga de la pagina 

  Future<void> _onRefresh() async { //funcion para recargar la pagina 
    await Future.delayed(const Duration(seconds: 1));
    _refreshNotifier.value++; // Incrementa el valor del notificador para forzar la actualización
  }

  @override
  Widget build(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>(); //refreshkey para actualizar la key de la clase
    return RefreshIndicator( //widget de recargar 
      key: refreshKey,
      onRefresh: _onRefresh, //funcion para sumar _refreshNotifier
      child: ValueListenableBuilder<int>( //ValueListenableBuilder para la recarga de la pagina 
        valueListenable: _refreshNotifier,
        builder: (context,_, __) {
          return FutureBuilder<List<RoutesUrban>>( //lista de la clase RoutesUrban que esta dentro del FutureBuilder
            future: RoutesUrbanization(), //llamamos a la funcion que consulta la rutas por urbanizacion
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Flexible(child: LoadingWidget());
              } else if (snapshot.hasData) {
                final routes = snapshot.data!;
                return buildRoutes(routes); //si tiene informacion el snapshot.hasData retorna el widgets de las rutas asociadas a la clase RoutesUrban
              }else {
                return const Text("No hay rutas por ahora");
              }
            },
          );
        },
      ),
    );
  }
}