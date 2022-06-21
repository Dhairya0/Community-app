import 'package:communityapp/Screens/LoginScreen.dart';
import 'package:communityapp/Screens/Login_screen.dart';
import 'package:communityapp/provider/event_provider.dart';
import 'package:communityapp/model/home_view_modelUploadImage.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ///Get.lazyPut(() => DataClass());
    return MultiProvider(
      child: MaterialApp(
        title: 'community_app',
        // themeMode: ThemeMode.dark,
        // darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.blueAccent),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: login_screen(),
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
      ],
    );
  }
}
