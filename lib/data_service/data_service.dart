import 'dart:convert';


import 'package:quoteoftheday/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataService {
  static Future<DataModel> fetchData() async {
    var uri = "https://favqs.com/api/qotd";
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(response.body));
    }

    throw "An Error Occurred";
  }
}
