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
  DataService dataService = DataService();

  @override
  void initState() {
    super.initState();
    dataModel = DataService.fetchData();
  }

  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataModel>(
        future: dataModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //print('Favorite: ${snapshot.data!.favorite}');
            // print(snapshot.data!.favorite);
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
                      Text(snapshot.data!.body),
                      const SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          isFavouriteIcon();
                          DataService.favData(snapshot.data!.id);
                        },
                        icon: Icon(
                          isFavourite ? Icons.bookmark : Icons.bookmark_outline,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.upgrade_sharp)),
                              Text("${snapshot.data!.upvotesCount}")
                            ],
                          ),
                          const SizedBox(),
                          GestureDetector(
                            onTap: () {
                              next();
                            },
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Text("Next"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.download_sharp)),
                              Text("${snapshot.data!.downvotesCount}")
                            ],
                          ),
                        ],
                      )
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

  void isFavouriteIcon() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }
}
