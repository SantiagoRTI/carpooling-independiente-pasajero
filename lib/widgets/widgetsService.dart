import 'package:caarpoling_independiente/controler/class/ResquesResponseServicesByRoute.dart';
import 'package:caarpoling_independiente/pages/InfoService.dart';
import 'package:flutter/material.dart';

Widget buildService (List<ServicesByRoute> services){
  return ListView.builder(
    itemCount: services.length,
    itemBuilder: (contex, index){
      final service = services[index];
      return Container(
        margin: const EdgeInsets.all(10),
        child: MaterialButton(
          color: Colors.blue,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15,),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0), // Puedes ajustar el radio según tus preferencias
          side: const BorderSide(color:  Colors.blue), // Cambia el color del borde aquí
          ),
          onPressed: (){//hacemos la navegacion hacia la pagina de la informacion del servicio selecionado
            Navigator.push(contex,MaterialPageRoute(builder: (context) => InfoService(nameService: service.nameService,)));
          },
          child: ListTile(
            title: Text("Servicio: ${service.nameService}",style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: [
                Row(children: [
                  Text("Conductor: ",style: TextStyle(fontWeight: FontWeight.bold), ),
                  Flexible(child: Text("${service.independentDriver.user.firstName} ${service.independentDriver.user.lastName}"))
                ],),
                Row(children: [
                  Text("Descripcion: ",style: TextStyle(fontWeight: FontWeight.bold),),
                  Flexible(child: Text("${service.description} ")),
                ],),
              ],
            )
          ),
        ),
      );
    },
  );
}