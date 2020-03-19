import 'package:covid19/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Covid-19",
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 48,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 7),
                    )
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Image(
                              image: AssetImage('assets/images/icon.png'),
                              width: 36,
                              height: 36,
                              fit: BoxFit.contain,
                          ),
                          SizedBox(width: 12,),
                          Text("Covid-19")
                        ],
                      ),
                    ),
                    Icon(Ionicons.ios_moon)
                  ],
                ),
              ),
              Text("Body")
            ],
          ),
        ),
      ),
    );
  }
}



