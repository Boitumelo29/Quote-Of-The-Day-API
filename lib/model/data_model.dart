import 'package:flutter/material.dart';

class DataModel {
  final String author;
  final String body;
  final String upvotesCount;
  final String downvotesCount;

  DataModel(
      {required this.author,
      required this.body,
      required this.upvotesCount,
      required this.downvotesCount});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        author: json["author"],
        body: json["body"],
        upvotesCount: json["upvotes_count"],
        downvotesCount: json["downvotes_count"]);
  }
}
