import "package:flutter/material.dart";
import 'SimpleCalculater.dart';
import 'package:splashscreen/splashscreen.dart';
void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return SplashScreen(
      
      seconds: 14,
      navigateAfterSeconds: SimpleCalculater(),
      // title: new Text('E-FAA Payment System',
      // style: new TextStyle(
      //   fontWeight: FontWeight.bold,
      //   fontSize: 20.0
      // ),),
      image:  Image.asset('assets/calc.gif'),
     
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 190.0,
      loaderColor: Colors.pinkAccent
     ) ;
  }
}