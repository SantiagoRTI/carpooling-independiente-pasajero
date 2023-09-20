import 'dart:convert' show json;
import 'package:caarpoling_independiente/controler/class/ResquesResponseServicesByRoute.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Future<List<ServicesByRoute>> RouteService(idRoute) async { //future para la consulta de 
  
  final token = await consultarToken();

  Map<String, String> headers ={
  'Content-Type': 'application/json',
  'Authorization': '$token'
  };

  final response = await http.get( //conexion con la api mandando el id da la ruta que queremos consultar
    headers: headers,
    Uri.parse('http://solas.com.co:8015/facade/get-independent/service/route?id=${idRoute}&status=53'),
  );

  if (response.statusCode == 200) { //si responde 200 le retorna la data de Json hacia la clase de ServicesByRoute
    final responseRoutes = response.body;
    final List<dynamic> routeData = json.decode(responseRoutes);
    return routeData.map<ServicesByRoute>((data) => ServicesByRoute.fromJson(data)).toList();
  }else{
    return [];
  }
}

Future<String?> consultarToken() async { // consulta el token del usaurio
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('userToken');

  return token;
}