import 'package:communityapp/Screens/Feedback.dart';
import 'package:communityapp/Screens/Gallery.dart';
import 'package:communityapp/Screens/ViewPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'EventPage.dart';
import 'HomeScreen.dart';
import 'ViewScreen.dart';
import 'News.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // body: Center(
      //   child: SingleChildScrollView(
      //     child: Container(
      //       color: Colors.white,
      //       child: Padding(
      //         padding: const EdgeInsets.all(12.0),
      //         child: Column(
      //           children: <Widget>[
      //             Align(
      //               alignment: Alignment.center,
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   Icon(
      //                     Icons.add,
      //                     color: Colors.blue,
      //                     size: 50.0,
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: [Posts(),Gallery(), News(),ViewScreen(), EventPage(), FormFour(), HomeScreen()]
          .elementAt(_selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        activeColor: Color(0xff00acee),
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.post_add)),
          BottomNavigationBarItem(icon: Icon(Icons.image)),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.feedback)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
