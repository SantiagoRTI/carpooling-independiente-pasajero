import 'dart:convert' show json, jsonEncode;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: non_constant_identifier_names
Future<String?> RoutesUrbanization() async {

  String? token = await consultarToken();
  // ignore: non_constant_identifier_names
  int? IdUrbanizacion = await consultarIdUrbanizacion();

  Map<String, String> headers ={
  'Content-Type': 'application/json',
  'Authorization': '$token'
  };

  final getAlServiceUrbanization = await http.get(
    headers: headers,
    Uri.parse('http://solas.com.co:8015/facade/get-independent/service/urbanization?id=$IdUrbanizacion&status=53'),
  );

  if (getAlServiceUrbanization.statusCode == 200) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final saveRoutes = getAlServiceUrbanization.body;

    prefs.setString('Routes', saveRoutes);
    
    return null;
  }else{
    return null;  
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