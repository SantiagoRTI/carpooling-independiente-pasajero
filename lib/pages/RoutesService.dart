import 'package:caarpoling_independiente/controler/LogicRoutesService.dart';
import 'package:caarpoling_independiente/controler/class/ResquesResponseServicesByRoute.dart';
import 'package:caarpoling_independiente/widgets/LoadingWidget.dart';
import 'package:caarpoling_independiente/widgets/widgetsService.dart';
import 'package:flutter/material.dart';

class Detailroute extends StatelessWidget {

  const Detailroute({super.key,  this.nameRoute, this.idRoute});

  // ignore: prefer_typing_uninitialized_variables
  final nameRoute;
  // ignore: prefer_typing_uninitialized_variables
  final idRoute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Servicios de la ruta $nameRoute"),//mostramos el nombre de la ruta por nombreRuta
      ),
      body: Center(child: Refresh(idRoute: idRoute,),) //retonnamos el widget de Refresh
    );
  }
}

// ignore: must_be_immutable
class Refresh extends StatelessWidget {

  // ignore: prefer_typing_uninitialized_variables
  final idRoute;

  Refresh({
    super.key, required this.idRoute
  });
  
  final ValueNotifier<int> _refreshNotifier = ValueNotifier<int>(0); //llamamos a la clase ValueNotifier y le asignamos un valor de 0

  Future<void> _onRefresh() async { //hacemos la funcion para cuando haga una recarga 
    await Future.delayed(const Duration(seconds: 1));
    _refreshNotifier.value++; // Incrementa el valor del notificador para forzar la actualización
  }

  @override
  Widget build(BuildContext context) {
    var refreshKey = GlobalKey<RefreshIndicatorState>();
    return RefreshIndicator( //enbolvemos todo en un RefreshIndicator
      key: refreshKey, 
      onRefresh: _onRefresh, //llamamos a la funcion para refrescar la pagina 
      child: ValueListenableBuilder<int>( //envolvemos todo en el widget de ValueListenableBuilder
        valueListenable: _refreshNotifier, //llamamos a la variable para que tenga valor 0
        builder: (context,_, __) {
          return FutureBuilder<List<ServicesByRoute>>(
            future: RouteService(idRoute), //llamamos a la funcion de routeservice para que traiga los servicios asociados a la ruta 
            builder: (context, snapshot) { 
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Flexible(child: LoadingWidget());
              } else if (snapshot.hasData) {
                final services = snapshot.data!;
                return buildService(services); //retornamos los widgets igual a la rutas por urbanizacion
              } else {
                return const Text("No hay servicios en esta ruta por ahora");
              }
            },
          );
        },
      ),
    );
  }
}