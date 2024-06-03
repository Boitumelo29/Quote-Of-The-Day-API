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

  void nextQuote(BuildContext context) {
    //testin
  }
}
