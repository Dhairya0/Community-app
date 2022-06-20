import 'package:firebase_core/firebase_core.dart';
import 'package:communityapp/api/Firebase_api.dart';
import 'package:communityapp/model/Firebase_file.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'ImagePage.dart';
// import 'package:firebase_download_example/page/image_page.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late Future<List<FirebaseFile>> futureFiles;
  Future<void> secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }
  // bool isSSAllowed = false;
  //
  // void toggelSS(){
  //   if(isSSAllowed){
  //     FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  //   }else{
  //     FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //   }
  //   setState((){
  //     isSSAllowed = false;
  //   });
  // }

  @override
  void initState() {
    secureScreen();
    super.initState();

    futureFiles = FirebaseApi.listAll('/Pictures');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      // App Bar
      title: Text(
        "Gallery",
        style: TextStyle(color: Colors.blue),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    ),
        body: FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text('Some error occurred!'));
                } else {
                  final files = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buildHeader(files.length),
                      const SizedBox(height: 15),
                      Expanded(
                        child: GridView.builder(
                        itemCount: files.length,
                        // itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {

                          final file = files[index];
                          return GestureDetector(
                            onTap:(){
                              Navigator.of(context)..push(MaterialPageRoute(builder: (context) => ImagePage(file: file)));
                            },
                          child: Container(

                            child: Image.network(
                    //images[index],
                             file.url,
                            fit: BoxFit.cover,

                  ),

                          ));

            },

                        ),
                          // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImagePage(file: file)));
                      ),
                    ],
                  );
                }
            }
          },
        ),
      );

  // Widget buildFile(BuildContext context, FirebaseFile file) =>
  //     // GridView.builder(
  //     //   //itemCount: images.length,
  //     //   itemCount: 30,
  //     //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //     //     crossAxisCount: 2,
  //     //   ),
  //     //   itemBuilder: (BuildContext context, int index) {
  // final file = files[index];
  //     //     return Container(
  //     //       child: Image.network(
  //     //         //images[index],
  //     //         file.url,
  //     //         fit: BoxFit.cover,
  //     //       ),
  //     //     );
  //     //   });
  //     ListTile(
  //       leading: ClipOval(
  //         child: Image.network(
  //           file.url,
  //           width: 52,
  //           height: 52,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       title: Text(
  //         file.name,
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           decoration: TextDecoration.underline,
  //           color: Colors.blue,
  //         ),
  //       ),
  //       onTap: () => Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => ImagePage(file: file),
  //       )),
  //     );

  // Widget buildHeader(int length) => ListTile(
  //       tileColor: Colors.blue,
  //       leading: Container(
  //         width: 52,
  //         height: 52,
  //         child: Icon(
  //           Icons.file_copy,
  //           color: Colors.white,
  //         ),
  //       ),
  //       title: Text(
  //         '$length Files',
  //         style: TextStyle(
  //           fontWeight: FontWeight.bold,
  //           fontSize: 20,
  //           color: Colors.white,
  //         ),
  //       ),
  //     );
//   Future<void> disableCapture() async {
//     //disable screenshots and record screen in current screen
//     await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
//   }
// }
}