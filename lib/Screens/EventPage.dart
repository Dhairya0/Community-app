
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;
  List<NetworkImage> _listOfImages = <NetworkImage>[];

  //  List data = [
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/11/08/09/41/deer-5723225_960_720.jpg"
  //   },
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/11/01/19/41/autumn-5704791_960_720.jpg"
  //   },
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/04/11/14/55/houses-5030731_960_720.jpg"
  //   },
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/11/16/16/05/hoverfly-5749361_960_720.jpg"
  //   },
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/04/19/12/26/thread-5063401_960_720.jpg"
  //   },
  //   {
  //
  //     "url":
  //     "https://cdn.pixabay.com/photo/2020/11/16/22/58/mountains-5750804_960_720.jpg"
  //   },
  // ];

   EventPage({Key? key, required this.documentSnapshot}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    _listOfImages = [];
    for (int i = 0;
    i <
        documentSnapshot['ImageArray']
            .length;
    i++) {
      _listOfImages.add(NetworkImage(documentSnapshot["ImageArray"][i]));
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // App Bar
        title: Text(
          documentSnapshot["Title"],
          style: TextStyle(color: Colors.blue),
        ),

        elevation: 0,
        backgroundColor: Colors.white,
      ),
        body: Column(
            children: [
            CarouselSlider.builder(


        //Slider Container properties
              options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true,
              autoPlay: true,

              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),

              ),
              itemCount: _listOfImages.length,
              itemBuilder: (context, index, realIndex){
                final _listofImages = _listOfImages[index];

                return  Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  color: Colors.grey,
                  child: Image.network(
                    documentSnapshot["EventImage"],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
              SizedBox(height: 50),
              Text(
                  documentSnapshot["Title"],
                  style: TextStyle(color: Colors.blue, fontSize: 45.0)
              ),
              SizedBox(height: 30),
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Text(
                  documentSnapshot["Desc"],
                  style: TextStyle(
                    height: 1.5,
                  ),
                ),
                // SizedBox(height: 40),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today_rounded),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      documentSnapshot["Date"],
                      style: TextStyle(
                          color: Colors.blue, fontSize: 15),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 0,0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      documentSnapshot["Address"] ,
                      style: TextStyle(
                          color: Colors.blue, fontSize: 15),
                    )
                  ],
                ),
              ),

  ])
    );

  }
  // Widget buildImage(String _listofImages , int Index) => Container(
  //   margin: EdgeInsets.symmetric(horizontal: 12),
  //   color: Colors.grey,
  //   child: Image.network(
  //     _listofImages,
  //     fit: BoxFit.cover,
  //   ),
  // );



}