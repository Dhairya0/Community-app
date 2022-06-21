import 'package:communityapp/db_model/feedback.dart';
import 'package:communityapp/model/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'package:fluttertoast/fluttertoast.dart';


class FormFour extends StatefulWidget {
  @override
  _FormFourState createState() => _FormFourState();
}

class _FormFourState extends State<FormFour> with Validator {
  // User? user = FirebaseAuth.instance.currentUser;
  // UserModel loggedInUser = UserModel();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final double minValue = 8.0;
  final databaseRef = FirebaseFirestore.instance;
  Future<void> secureScreen() async {
    await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  }

  final _formKey = GlobalKey<FormState>();
  int experienceIndex = 0;
  String? errorMessage;

  final TextStyle _errorStyle = TextStyle(
    color: Colors.blue,
    fontSize: 16.6,
  );


  @override
  void initState() {
    secureScreen();
    _onCreated();
    super.initState();

  }

  void _onCreated() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void _onTapEmoji(int index) {
    setState(() {
      experienceIndex = index;
    });
  }

  final Color activeColor = Colors.blue;
  final Color inActiveColor = Colors.grey;


  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue),
      child: TextField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            labelText:  'Name',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.blue)),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue),
      child: TextField(
        controller: _emailController,
        keyboardType: TextInputType.text,
        onChanged: (String value) {},
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.blue)),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue, vertical: minValue),
      child: TextFormField(
        controller: _messageController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: InputBorder.none,
            labelText: 'Description',
            contentPadding: EdgeInsets.symmetric(horizontal: minValue),
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.blue)),
      ),
    );
  }

  Widget _buildTextBackground(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(2)),
      child: child,
    );
  }

  Widget _buildSubmitBtn() {
    FeedbackModel feedbackModel = FeedbackModel();

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          gradient: LinearGradient(colors: [Colors.blue, Colors.blue])),
      child: RaisedButton(
        onPressed: ()
          {
            feedbackModel.name = _nameController.text;
            feedbackModel.email = _emailController.text;
            feedbackModel.suggestion = _messageController.text;
            databaseRef
                .collection('suggestions')
                .doc()
                .set(feedbackModel.toMap());
            Fluttertoast.showToast(msg: "Your Suggestion Noted");
          },
        padding: EdgeInsets.symmetric(vertical: minValue * 2.4),
        elevation: 0.0,
        color: Colors.transparent,
        textColor: Colors.white,
        child: Text('SUBMIT'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/feedback-four-bg.webp'),
                fit: BoxFit.cover)),
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.white,
            Colors.white
          ])),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: minValue * 5,
                        ),
                        Text(
                          "Write Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 48.0,
                              color: Colors.blue),
                        ),
                        SizedBox(
                          width: 110.0,
                          child: Container(
                            height: 4,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        Text(
                          "Feel free to provide your valuable suggestions",
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: minValue * 7,
                        ),



                        _buildTextBackground(_buildName()),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        _buildTextBackground(_buildEmail()),
                        SizedBox(
                          height: minValue * 2,
                        ),
                        _buildTextBackground(_buildDescription()),
                        SizedBox(
                          height: minValue * 6,
                        ),
                        _buildSubmitBtn()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  }
  // void signUp(String email, String password) async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .createUserWithEmailAndPassword(email: email, password: password)
  //           .then((value) => {postDetailsToFirestore()})
  //           .catchError((e) {
  //         Fluttertoast.showToast(msg: e!.message);
  //       });
  //     } on FirebaseAuthException catch (error) {
  //       switch (error.code) {
  //         case "invalid-email":
  //           errorMessage = "Your email address appears to be malformed.";
  //           break;
  //         case "wrong-password":
  //           errorMessage = "Your password is wrong.";
  //           break;
  //         case "user-not-found":
  //           errorMessage = "User with this email doesn't exist.";
  //           break;
  //         case "user-disabled":
  //           errorMessage = "User with this email has been disabled.";
  //           break;
  //         case "too-many-requests":
  //           errorMessage = "Too many requests";
  //           break;
  //         case "operation-not-allowed":
  //           errorMessage = "Signing in with Email and Password is not enabled.";
  //           break;
  //         default:
  //           errorMessage = "An undefined Error happened.";
  //       }
  //       Fluttertoast.showToast(msg: errorMessage!);
  //       print(error.code);
  //     }
  //   }
  // }
  // postDetailsToFirestore() async {
  //   // calling our firestore
  //   // calling our user model
  //   // sedning these values
  //
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;
  //
  //   FeedbackModel feedbackModel = FeedbackModel();
  //
  //   // writing all the values
  //   feedbackModel.name = _nameController.text;
  //   feedbackModel.email = _emailController.text;
  //   feedbackModel.desc = _messageController.text;
  //
  //   final collection = FirebaseFirestore.instance.collection('feedback');
  //   await collection.doc().set({
  //   'timestamp': FieldValue.serverTimestamp(),
  //   'feedback': _messageController.text,
  //   });
  //   Fluttertoast.showToast(msg: "Account created successfully :) ");
  //
  //   Navigator.pushAndRemoveUntil(
  //       (context),
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //           (route) => false);
  // }

