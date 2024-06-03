import 'package:flutter/material.dart';

class DataModel {
  final int id;
  final String author;
  final String body;
  final int upvotesCount;
  final int downvotesCount;
  final bool favorite;

  DataModel(
      {required this.id,
      required this.author,
      required this.body,
      required this.upvotesCount,
      required this.downvotesCount,
      required this.favorite
      });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    return DataModel(
        id: quoteJson['id'],
        author: quoteJson["author"],
        body: quoteJson["body"],
        upvotesCount: quoteJson["upvotes_count"],
        downvotesCount: quoteJson["downvotes_count"],
        favorite: quoteJson['user_details']
    );
  }
}
// remove fav