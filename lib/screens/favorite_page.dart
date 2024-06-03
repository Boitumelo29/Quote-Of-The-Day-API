import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
        IconButton(
        onPressed: ()
    {
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
