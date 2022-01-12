import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:outlook/api_links.dart';

class AuthServices{
  static Future<http.Response> register(
      String name,
      String email,
      String password,
      ) async{
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = jsonEncode(data);
    http.Response response = await http.post(
        Uri.parse(Authregister),
        headers: header,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(

      String email,
      String password,
      ) async{
    Map data = {
      "email": email,
      "password": password,
    };
    var body = jsonEncode(data);
    http.Response response = await http.post(
      Uri.parse(Authlogin),
      headers: header,
      body: body,
    );
    print(response.body);
    return response;
  }
  static Future<http.Response> PostTopics(
      String title,
      String content,
      int id_cat,
      ) async{
    Map data = {
      "title": title,
      "content": content,
      "id_cat": id_cat,
    };
    var body = jsonEncode(data);
    http.Response response = await http.post(
      Uri.parse(CreateTopics),
      headers: header,
      body: body,
    );
    print(response.body);
    return response;
  }
}

errorSnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(text),
        duration: Duration(seconds: 3),
        )
  );
}
/*
class CallApiPost{
  bool isGO = false;
  postData(data, apiUrl) async {
    var response = await http.post(
      Uri.parse(apiUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
    if(response.statusCode == 201){
      isGO = true;
    }
    return response;
  }
  _setHeaders()=>{
    'Content-type':'application/json',
    'Accept':'application/json',
  };
}

class CallApiGet{
  List list = [];

  Future getData(apiUrl) async {
    final http.Response response =
    await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      list = jsonDecode(response.body);
      return true;
    }else{
      return false;
    }
  }
}


 */