import 'package:http/http.dart' as http;
import 'dart:convert';
import 'endpoints.dart';

class ApiMaterias{

  static Future<List<dynamic>> getMaterias() async{
    final response = await http.get('${Endpoints.BASE_URL_MATERIAS}');
    if( response.statusCode == 200 ){
      return json.decode(response.body);
    }else{
      return null;
    }
  }

  static Future<bool> addMateria(body) async{
    final response = await http.post(
      '${Endpoints.BASE_URL_MATERIAS}',
      headers: <String,String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body)
    );

    if( response.statusCode == 200 || response.statusCode == 201 ){
      return true;
    }else{
      return false;
    }
  }
}