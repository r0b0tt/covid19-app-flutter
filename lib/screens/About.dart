import 'package:covid19/components/BottomNavBar.dart';
import 'package:covid19/components/TopNavBar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[TopNavBar(), Text("About")],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
