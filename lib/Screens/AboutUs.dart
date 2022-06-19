import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:communityapp/db_model/AboutUs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Feedback.dart';
import '../db_model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  // User? user = FirebaseAuth.instance.currentUser;
  AboutUsModel loggedInUser = AboutUsModel();
  static final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("AboutUs")
        .doc("EbTR08cs6zdtRiSVN81d")
        .get()
        .then((value) {
      this.loggedInUser = AboutUsModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget textfield({@required hintText}) {
    return Material(

      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.blue),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        // App Bar
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.white),
        ),

        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${loggedInUser.Name}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("${loggedInUser.Desc}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),
                    Text("${loggedInUser.Email}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),

                    Text("${loggedInUser.Profession}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),

                    Text("${loggedInUser.ContactNo}",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(height: 20),
                    // loginButton,
                    // ActionChip(
                    //     label: Text("Logout"),
                    //     onPressed: () {
                    //       logout();
                    //     }),
                  ],
                ),
              )
            ],
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${loggedInUser.Image}"),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

// the logout function
  Future<void> logout() async {
    // await FirebaseAuth.instance.signOut();
    // Fluttertoast.showToast(msg: "Logged out succesfully");
    // Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => LoginScreen()));
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// the logout function

