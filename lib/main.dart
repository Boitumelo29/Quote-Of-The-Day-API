import 'package:flutter/material.dart';
import 'package:quoteoftheday/screens/favorite_page.dart';
import 'package:quoteoftheday/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}
//the link : https://favqs.com/api/
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String title = " Quote Of The Day";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title),
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Icon(
                Icons.home,
                color: Colors.grey,
              ),
              Icon(Icons.favorite, color: Colors.grey),
            ],
          ),
          body: const TabBarView(
            children: [HomePage(), FavoritePage()],
          ),
        ),
      ),
    );
  }
}
