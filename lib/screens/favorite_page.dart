import 'package:flutter/material.dart';
import 'package:quoteoftheday/data_service/data_service.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    DataService.listData();
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            DataService.listData();
            setState(() {
              isFavourite = !isFavourite;
            });
          },
          icon: Icon(
            isFavourite ? Icons.bookmark : Icons.bookmark_outline,
          ),
        )
      ],
    );
  }
}
