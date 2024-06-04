import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quoteoftheday/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  Function? onUpdate;

  static Future<DataModel> fetchData() async {
    var uri = "https://favqs.com/api/qotd";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    }

    throw "An Error Occurred";
  }

  void nextQuote(BuildContext context) {}

  static Future<DataModel> favData(int id) async {
    var uri = "https://favqs.com/api/quotes/:$id/fav";

    final response = await http.put(Uri.parse(uri));

    // try{
    //   return DataModel.fromJson(json.decode(response.body));
    // }catch(e){}

    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    }
    throw "error";
  }

  static Future<DataModel> listData() async {
    var uri = "https://favqs.com/api/quotes";
    final response = await http.get(Uri.parse(uri));
    print(response.body);

    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    }
    throw "error";
  }

  // I created function that collects the usersname, email, password

  static Future<UserModel> createUser(

      String username, String email, String password) async {
    const String apiToken = "9afc0a32916435e644daaac28f617a69";
    var uri = "https://favqs.com/api/users";
    final response = await http.post(
      Uri.parse(uri),
      headers: <String, String>{'Content-Type': 'application/json',
        'Authorization': 'Token token="$apiToken"',
        "User-Token": "USER_SESSION_TOKEN"
      },
      body: jsonEncode({
        'user': {
          'login': username,
          'email': email,
          'password': password,
        },
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }else{
      print(response.request);
    }

    try{
      return UserModel.fromJson(json.decode(response.body));
    }catch(e){
      print(e);

    }
    throw "";
  }
}
