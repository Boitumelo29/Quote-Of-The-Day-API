import 'package:flutter/material.dart';
import 'package:quoteoftheday/data_service/data_service.dart';
import 'package:quoteoftheday/model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<DataModel> dataModel;

  @override
  void initState() {
    super.initState();
    dataModel = DataService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.author);
             return Center(
              child: Card(
                color: Colors.pinkAccent[300],
                child: Column(
                  children: [Text(snapshot.data!.author)],
                ),
              ),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}
