import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import '../db_model/news.dart';


class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var db = FirebaseFirestore.instance.collection("news_and_update").snapshots();
  NewsModel news = NewsModel();
  Future<void> secureScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void initState() {
    secureScreen();
    super.initState();

  }
  // var imgList = [
  //   "assets/news.png",
  //   "assets/news.png",
  //   "assets/news.png",
  //   "assets/news.png",
  //   "assets/news.png",
  //   "assets/news.png",
  //   "assets/news.png",
  // ];
  // var descList = [
  //   "Push yourself, because no one else is going to do it for you.",
  //   "Your limitation—it's only your imagination.",
  //   "Hard Work changes the life.",
  //   "Sometimes it's the smallest decisions that can change your life forever.",
  //   "Confidence is the most beautiful thing you can possess",
  //   "A big business starts small.",
  //   "Talent wins games, but teamwork and intelligence win championships."
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "News",
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: db,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, int index){
                // return Text(snapshot.data!.docs[index]['Title']);
                Timestamp timestamp1 = snapshot.data!.docs[index]['timestamp']; // timestamp in seconds
                DateTime date1 = timestamp1.toDate();
                return Card(
                  elevation: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          // Container(
                          //   width: 60,
                          //   height: 60,
                          //   decoration: BoxDecoration(
                          //
                          //       borderRadius: BorderRadius.circular(60/2),
                          //       image: DecorationImage(
                          //           fit: BoxFit.cover,
                          //           image: Image.asset("assets/news.png");
                          //       )
                          //   ),
                          // ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width-140,
                                  child: Text(snapshot.data!.docs[index]['NewsUpdate'],style: TextStyle(fontSize: 17,color: Colors.blue),)),
                              SizedBox(height: 10,),
                            Text(snapshot.data!.docs[index]['description'],style: TextStyle(fontSize: 17,color: Colors.blue),),
                              SizedBox(height: 10,),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.calendar_today_rounded),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    date1.toString() ,
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                  )

                                ],

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
          });
        },
      ),

    );
  }
}
