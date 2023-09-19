import 'package:caarpoling_independiente/controler/class/reques_response.dart';
import 'package:caarpoling_independiente/pages/ServiceInfo.dart';
import 'package:flutter/material.dart';


Widget buildRoutes(List<RoutesUrban> routes) {
    return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              final route = routes[index];
              return Container(
                margin: const EdgeInsets.all(10),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0), // Puedes ajustar el radio según tus preferencias
                  side: const BorderSide(color: const Color.fromRGBO(190, 30, 45, 1),), // Cambia el color del borde aquí
                  ),
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleRuta(nombreRuta: '${route.independentRoute.nameRoute}',nombreConductor: '${route.independentDriver.user.email}',), // Reemplaza NuevaPagina con el nombre de la página a la que deseas redirigir
                    ),);
                  },
                  child: ListTile(
                    title: Text("Ruta: ${route.independentRoute.nameRoute}",style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      children: [
                        Row(children: [
                          Text("Conductor: ",style: TextStyle(fontWeight: FontWeight.bold), ),
                          Flexible(child: Text("${route.independentDriver.user.firstName} ${route.independentDriver.user.lastName}"))
                        ],),
                        Row(children: [
                          Text("Descripcion: ",style: TextStyle(fontWeight: FontWeight.bold),),
                          Flexible(child: Text("${route.description} ")),
                        ],),
                      ],
                    )
                  ),
                ),
              );
            },
    );
  }
  