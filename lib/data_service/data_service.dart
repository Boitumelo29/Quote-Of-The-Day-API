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

  static Future<DataModel> favData() async {
    var uri = "/api/quotes/:quote_id/fav";

    final response = await http.put(Uri.parse(uri));

    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    }
    throw "error";
  }
}

///example on how to implement
//static Future<DataModel> favData(String quoteId) async {
//     var uri = Uri.parse('$baseUrl/api/quotes/$quoteId/fav');
//
//     final response = await http.post(uri);
//
//     if (response.statusCode == 200) {
//       return DataModel.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to mark as favourite');
//     }
//   }
