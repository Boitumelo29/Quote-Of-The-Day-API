import 'package:flutter/material.dart';

class DataModel {
  final String author;
  final String body;
  final int upvotesCount;
  final int downvotesCount;

  DataModel(
      {required this.author,
      required this.body,
      required this.upvotesCount,
      required this.downvotesCount});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    return DataModel(
        author: quoteJson["author"],
        body: quoteJson["body"],
        upvotesCount: quoteJson["upvotes_count"],
        downvotesCount: quoteJson["downvotes_count"]);
  }
}
