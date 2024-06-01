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
    return FutureBuilder<DataModel>(
        future: dataModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.pinkAccent[300],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.author),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(snapshot.data!.body)
                  ],
                ),
              ),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}
