import 'package:covid19/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Card(
                margin: EdgeInsets.all(16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView(
                    children: <Widget>[
                      _Section("Name", "Covid-19 App"),
                      SizedBox(
                        height: 24,
                      ),
                      _Section("Version", "1.0.0"),
                      SizedBox(
                        height: 24,
                      ),
                      _Section("Developer", "Terra Innovations"),
                      SizedBox(
                        height: 24,
                      ),
                      _Section("Contact", "antonio@terrainnovations.cop"),
                      SizedBox(
                        height: 24,
                      ),
                      _Section("Data Source", "covid19.mathdro.id/api"),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Icon(
                            Ionicons.logo_instagram,
                            size: 36,
                          ),
                          Icon(Ionicons.logo_twitter, size: 36),
                          Icon(Ionicons.logo_github, size: 36),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String text;

  _Section(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.BLUE,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
