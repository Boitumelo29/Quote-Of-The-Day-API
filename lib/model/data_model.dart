import 'package:flutter/material.dart';

class DataModel {
  final String author;
  final String body;
  final int upvotesCount;
  final int downvotesCount;
  final bool favorite;

  DataModel(
      {required this.author,
      required this.body,
      required this.upvotesCount,
      required this.downvotesCount,
      required this.favorite});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    return DataModel(
        author: quoteJson["author"],
        body: quoteJson["body"],
        upvotesCount: quoteJson["upvotes_count"],
        downvotesCount: quoteJson["downvotes_count"],
        favorite: quoteJson['user_details']['favorite']);
  }
}
