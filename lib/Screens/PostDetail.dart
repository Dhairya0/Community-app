
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final DocumentSnapshot documentSnapshot;




  PostDetail({Key? key, required this.documentSnapshot}) : super(key: key);




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
            "Post",
            style: TextStyle(color: Colors.blue),
          ),

          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
            children: [
              Image.network(
                documentSnapshot['PostImage'],

              ),
              SizedBox(height: 200),
              Text(
                  documentSnapshot['Quote'],
                  style: TextStyle(color: Colors.blue, fontSize: 45.0)
              ),
              SizedBox(height: 30),

            ]
        )
    );
  }


}