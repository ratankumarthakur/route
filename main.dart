import 'package:bmi/screen_1.dart';
import 'package:bmi/screen_2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();                         //this is required to integrate our code with firrebase
  await Firebase.initializeApp(
      options:  FirebaseOptions(
          apiKey: "AIzaSyAvr9wIyrDBEq6Lv1wAl7e6N30FKt9iJME",
          appId: "1:685103828281:android:0b6b0930185856e2ff2ce8",
          messagingSenderId: "685103828281",
          projectId: "crud-at-firebase-f0e04")
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: sc(),
      routes: {
        '/sc2':(context)=>sc2(),              //defining routes so as to use shortcut of navigation
        '/sc':(context)=>sc(),

      },
    ); // MaterialApp
  }
}
