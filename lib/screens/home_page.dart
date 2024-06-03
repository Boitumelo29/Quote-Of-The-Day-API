import 'package:flutter/material.dart';
import 'package:quoteoftheday/data_service/data_service.dart';
import 'package:quoteoftheday/model/data_model.dart';
import 'package:skeleton_text/skeleton_text.dart';

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
    bool isFavourite = false;
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.author),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text(snapshot.data!.body),
                        const SizedBox(height: 10,),
                          IconButton(onPressed: (){}, icon: Icon( isFavourite ? Icons.bookmark_outlined : Icons.bookmark_outlined))
                        ],),
                       const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            next();
                          },
                          child: Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text("Next"),
                              )))
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(
            child: SkeletonAnimation(
                child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
            )),
          );
        });
  }

  void next() {
    setState(() {
      build(context);
    });
  }
}
