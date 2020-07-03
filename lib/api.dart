import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model.dart';

Future login(String username, String password) async {
  String url = "http://192.168.43.174/flutter/login.php";
  final response = await http.post(url,
      headers: {'Accept': 'Application/json'},
      body: {'email': username, 'password': password});
      var convertedData=response.body;
      return convertedData;
}
Future register(String name,String email,String mobile,String pass) async{
  String url="http://192.168.43.174/flutter/register.php";
  final response=await http.post(url,
  // headers:{'Accept':'Application/json'},
  body:{'name':name,'email':email,'mobile':mobile,'password':pass});
  var convertedData=response.body;
  return convertedData;
}

Future<List<Model>> getAllData() async
{
  String url="http://192.168.43.174/flutter/allData.php";
  final response=await http.get(url,
  headers: {'Accept':'Application/json'});
  return modelFromJson(response.body);

}
