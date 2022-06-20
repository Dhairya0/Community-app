import 'package:communityapp/api/Firebase_api.dart';
import 'package:communityapp/model/Firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

class ImagePage extends StatelessWidget {
  final FirebaseFile file;

  const ImagePage({
    Key? key,
    required this.file,
  }) : super(key: key);
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  void initState() {
    secureScreen();
  }
  @override
  Widget build(BuildContext context) {
    final isImage = ['.jpeg', '.jpg', '.png' , '.jfif'].any(file.name.contains);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // App Bar
        


        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: isImage
          ? Center(
          child: Image.network(
              file.url,
              width: 400,
              height: 300,

              fit: BoxFit.cover,
            )
      )
          : Center(
              child: Text(
                'Cannot be displayed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
    );

  }
  Future<void> disableCapture() async {
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
}
