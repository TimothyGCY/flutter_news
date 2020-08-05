import 'package:flutter/material.dart';
import 'package:flutter_news/navbar.dart';

void main() {
  runApp(FlutNews());
}

class FlutNews extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter News',
        theme: ThemeData(
            primaryColor: Colors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: Colors.white,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
        ),
        home: NavBar());
  }
}
