import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
const EventPage({Key? key}) : super(key: key);

@override
_EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  // a list of images' URLs
  var db = FirebaseFirestore.instance.collection("Events").snapshots();
  final List data = [
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/11/08/09/41/deer-5723225_960_720.jpg"
    },
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/11/01/19/41/autumn-5704791_960_720.jpg"
    },
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/04/11/14/55/houses-5030731_960_720.jpg"
    },
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/11/16/16/05/hoverfly-5749361_960_720.jpg"
    },
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
    },
    {

      "url":
      "https://cdn.pixabay.com/photo/2020/11/16/22/58/mountains-5750804_960_720.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // App Bar
        title: Text(
          "Event 1",
          style: TextStyle(color: Colors.blue),
        ),

        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Implement the image carousel
          CarouselSlider(
            options: CarouselOptions(
            height: 300.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
            items: data.map((item) {
              return GridTile(
                child: Image.network(item["url"], fit: BoxFit.cover),
                footer: Container(
                    padding: const EdgeInsets.all(15),
                    // color: Colors.black54,
                    ),
              );
            }).toList(),
          ),
           SizedBox(height: 30),
          Text(
            'Event 1',
              style: TextStyle(color: Colors.blue, fontSize: 45.0)
          ),
          SizedBox(height: 30),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
            child: Text(
            "Description.",
            style: TextStyle(
            height: 1.5,
            ),
          ),
          // SizedBox(height: 40),
          ),
        Padding(padding: EdgeInsets.fromLTRB(130, 0, 130, 4),
          child: Row(
              children: <Widget>[
              Icon(Icons.calendar_today_rounded),
              SizedBox(
              width: 8,
            ),
            Text(
              "12-06-2022",
            style: TextStyle(
            color: Colors.blue, fontSize: 15),
          )
          ],
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(110, 0, 100, 0),
          child: Row(
              children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(
              width: 8,
            ),
            Text(
            "Prahlad nagar,A'bad",
            style: TextStyle(
            color: Colors.blue, fontSize: 15),
          )
        ],
      ),
        ),
    ]
    ));
  }
}