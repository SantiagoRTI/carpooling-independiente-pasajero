// ignore_for_file: file_names

import 'dart:convert' show json;
import 'package:caarpoling_independiente/controler/class/reques_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Future<List<RoutesUrban>> RoutesUrbanization() async {
  
  final token = await consultarToken();
  final idUrbanizacion = await consultarIdUrbanizacion();

  Map<String, String> headers ={
  'Content-Type': 'application/json',
  'Authorization': '$token'
  };

  final response = await http.get(
    headers: headers,
    Uri.parse('http://solas.com.co:8015/facade/get-independent/service/urbanization?id=1&status=53'),
  );

  if (response.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final responseRoutes = response.body;
    prefs.setString('Routes', responseRoutes);
    
    final List<dynamic> routeData = json.decode(responseRoutes);
    return routeData.map<RoutesUrban>((data) => RoutesUrban.fromJson(data)).toList(); // Devuelve una instancia de RoutesUrban
  }else{
    return [];
  }  
}

Future<String?> consultarToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('userToken');

  return token;
}

Future<int?> consultarIdUrbanizacion() async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? urbanizationData = prefs.getString('userUrbanization');

  Map<String, dynamic> urbanizationMap = json.decode(urbanizationData!);
  int urbanizationId = urbanizationMap['id'];
  return urbanizationId;  
  
}