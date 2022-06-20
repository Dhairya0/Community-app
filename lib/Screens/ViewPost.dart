import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import '../db_model/news.dart';


class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var db = FirebaseFirestore.instance.collection("Posts").snapshots();
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
          "Posts",
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
                DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                 return GestureDetector(
                    onTap: () {
                      // This Will Call When User Click On ListView Item
                      showDialogFunc(context, documentSnapshot);
                    },
                // return Text(snapshot.data!.docs[index]['Title']);
                child: Card(
                  elevation: 1.5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Row(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                // color: primary,
                                borderRadius: BorderRadius.circular(60/2),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(snapshot.data!.docs[index]['PostImage'])
                                )
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width-140,
                                  child: Text(snapshot.data!.docs[index]['Quote'],style: TextStyle(fontSize: 17,color: Colors.blue),)),
                              SizedBox(height: 10,),
                              // Text(snapshot.data!.docs[index]['Desc'],style: TextStyle(color: Colors.blue),)
                            ],
                          )
                        ],
                      ),

                    ),
                  ),
                ));
              });
        },
      ),

    );
  }
}
showDialogFunc(context, dataSnapshot) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    dataSnapshot['PostImage'],
                    width: 400,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  dataSnapshot['Quote'],
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   // width: 200,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       dataSnapshot['Quote'],
                //       maxLines: 3,
                //       style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
