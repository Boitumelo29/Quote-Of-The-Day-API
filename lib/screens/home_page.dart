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
    // TODO: implement initState
    super.initState();
    dataModel = DataService.fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[],
    );
  }
}
