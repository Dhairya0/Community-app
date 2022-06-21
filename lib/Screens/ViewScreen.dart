import 'package:communityapp/Screens/EventPage.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';


class ViewScreen extends StatefulWidget {
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  var db = FirebaseFirestore.instance.collection("event").snapshots();
  Future<void> secureScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  void initState() {
    secureScreen();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "Events",
          style: TextStyle(color: Colors.blue),
        ),
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
                Timestamp timestamp1 = snapshot.data!.docs[index]['from']; // timestamp in seconds
                DateTime date1 = timestamp1.toDate();
                Timestamp timestamp2 = snapshot.data!.docs[index]['to']; // timestamp in seconds
                DateTime date2 = timestamp2.toDate();
                // String Desc = snapshot.data!.docs[index]['Desc'];
                // String Location = snapshot.data!.docs[index]['Location'];
                // String Date = snapshot.data!.docs[index]['Date'];
                // String Address = snapshot.data!.docs[index]['Address'];
                // String Image = snapshot.data!.docs[index]['EventImage'];
                // return Text(snapshot.data!.docs[index]['Title']);
                return Card(
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
                                    image: NetworkImage(documentSnapshot['ImageUrl'])
                                )
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                  width: MediaQuery.of(context).size.width-140,
                                  child: Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontSize: 17,color: Colors.blue),)),
                              SizedBox(height: 5,),
                              // Icon(Icons.calendar_month),
                              // Text(snapshot.data!.docs[index]['Date'],style: TextStyle(color: Colors.blue),),
                              SizedBox(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.calendar_today_rounded),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(date1.toString(),style: TextStyle(color: Colors.blue),),
                                    // Text("-",style: TextStyle(color: Colors.blue),),
                                    // Text(date2.toString(),style: TextStyle(color: Colors.blue),),

                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.calendar_today_rounded),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(date2.toString(),style: TextStyle(color: Colors.blue),),
                                  ],
                                ),
                              ),
                               // Icon(Icons.location_on),
                               // Text(snapshot.data!.docs[index]['Location'],style: TextStyle(color: Colors.blue),),
                            ],
                          )
                        ],
                      ),
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> EventPage(documentSnapshot: documentSnapshot)))
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
