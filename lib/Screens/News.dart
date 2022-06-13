import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../db_model/news.dart';


class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var db = FirebaseFirestore.instance.collection("news").snapshots();
  NewsModel news = NewsModel();
  void initState() {
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
                return Text(snapshot.data!.docs[index]['Title']);
          });
        },
      ),

    );
  }
}
