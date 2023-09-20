import 'package:flutter/material.dart';

class InfoService extends StatelessWidget {


  const InfoService({super.key, this.nameService,  });

  final nameService;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servicio ${nameService} "),
      ),
      body: Center(

      ),
    );
  }
}