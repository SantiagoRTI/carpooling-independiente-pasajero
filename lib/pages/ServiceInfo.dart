import 'package:flutter/material.dart';

class DetalleRuta extends StatefulWidget {
  final String nombreRuta;
  final String nombreConductor;

  const DetalleRuta({super.key, required this.nombreRuta, required this.nombreConductor});

  @override
  State<DetalleRuta> createState() => _DetalleRutaState();
}

class _DetalleRutaState extends State<DetalleRuta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombreRuta),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Detalles de la ruta: ${widget.nombreRuta}'),
            Text('Detalles de la ruta: ${widget.nombreConductor}'),
          ],
        ),
      ),
    );
  }
}