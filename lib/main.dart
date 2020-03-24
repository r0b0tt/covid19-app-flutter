import 'package:covid19/components/BottomNavBar.dart';
import 'package:covid19/screens/Home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        title: "Covid-19 App",
        home: Scaffold(
          body: Home(),
          bottomNavigationBar: BottomNavBar(),
        ),

    );
  }
}
