import 'package:model_example_api/model/user.dart';

import 'package:http/http.dart'as http;
import 'dart:convert';



class UserApi{
  // void fetchUsers()async{
  static Future <List<User>> fetchUsers()async{
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
  final response =  await http.get(uri);
  final body = response.body;
  final json = jsonDecode(body);
  final results = json['results'] as List<dynamic>;
  final users = results.map((e){
   return User.fromMap(e);
     
  }).toList();
  return users;
    // users = json['results'];
  }
}