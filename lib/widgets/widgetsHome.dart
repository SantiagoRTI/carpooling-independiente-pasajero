import 'package:caarpoling_independiente/controler/LogicRoutesService.dart';
import 'package:caarpoling_independiente/controler/class/RequesrResponseRoutesUrban.dart';
import 'package:caarpoling_independiente/pages/RoutesService.dart';
import 'package:flutter/material.dart';

Widget buildRoutes(List<RoutesUrban> routes) { //Widget de las rutas por las urbanizacion
    return ListView.builder( //retornamos un listview.builder
      itemCount: routes.length, //el itemcpunt es la misma que routes
      itemBuilder: (context, index){ 
        final route = routes[index]; //convertimos los routes en un index para consultar los datos de la ruta
        final routeId = route.independentRoute.id; //guardamos el id de la ruta
        return Container( 
          margin: const EdgeInsets.all(10),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0), // Puedes ajustar el radio según tus preferencias
              side: const BorderSide(color: Color.fromRGBO(190, 30, 45, 1),), //
              ),
              onPressed: (){ //cuando damos clic en la ruta nos redirige a sus servicios asociados
                RouteService(routeId); //consultamos los servicios asociados a la ruta
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Detailroute(nameRoute: route.independentRoute.nameRoute,idRoute: '${route.independentRoute.id}'), //navegamos a la pagina de los servicios asociados a la ruta y enviamos los detalles de la ruta 
                  ),);
              },
              child: ListTile( //Mostramos el nombre de la ruta consultando la clase 
                title: Center(child: Text("Ruta: ${route.independentRoute.nameRoute}",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
              ),
          ),
        );
      },
    );
  }