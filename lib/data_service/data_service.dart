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

  static Future<UserModel> createUser() async {
    var uri = "https://favqs.com/api/users";
    final response = await http.post(Uri.parse(uri));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    }
    throw "";
  }
}
