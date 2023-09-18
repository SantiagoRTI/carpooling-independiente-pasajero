import 'package:flutter/material.dart';

class DetalleRuta extends StatefulWidget {
  final String nombreRuta;

  const DetalleRuta({super.key, required this.nombreRuta});

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
      // Aquí puedes agregar contenido relacionado con los detalles de la ruta
      body: Center(
        child: Text('Detalles de la ruta: ${widget.nombreRuta}'),
      ),
    );
  }
}
