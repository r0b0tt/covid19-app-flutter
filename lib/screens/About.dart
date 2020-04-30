import 'dart:async';

import 'package:covid19/assets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  PackageInfo _packageInfo = PackageInfo(appName: "Unknown");

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.GREY,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView(
                  children: <Widget>[
                    _Section(
                      title: "Name",
                      text: _packageInfo.appName ?? "Covid-19 App",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    _Section(
                        title: "Version",
                        text: _packageInfo.version ?? "1.0.0"),
                    SizedBox(
                      height: 24,
                    ),
                    _Section(
                        title: "Developer",
                        text: "Terra Innovations",
                        link: "https://terrainnovations.co"),
                    SizedBox(
                      height: 24,
                    ),
                    _Section(
                      title: "Contact",
                      text: "antonio@terrainnovations.co",
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "DATA SOURCE",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.BLUE,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        _TextLink(
                          text: "Johns Hopkins CSSE",
                          url:
                              "https://systems.jhu.edu/research/public-health/ncov/",
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        _TextLink(
                          text: "World Health Organization",
                          url:
                              "https://www.who.int/emergencies/diseases/novel-coronavirus-2019  ",
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        _TextLink(
                          text: "covid19.mathdro.id/api",
                          url: "https://covid19.mathdro.id/api",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () => _launchUrl(
                              "https://instagram.com/terra_innovations"),
                          child: Icon(
                            Ionicons.logo_instagram,
                            size: 36,
                          ),
                        ),
                        InkWell(
                          onTap: () =>
                              _launchUrl("https://twitter.com/__r0b0t__"),
                          child: Icon(
                            Ionicons.logo_twitter,
                            size: 36,
                          ),
                        ),
                        InkWell(
                          onTap: () => _launchUrl(
                              "https://github.com/r0b0tt/covid19-app-flutter"),
                          child: Icon(
                            Ionicons.logo_github,
                            size: 36,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final String text;
  final String link;

  _Section({@required this.title, @required this.text, this.link});

  @override
  Widget build(BuildContext context) {
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
        link != null
            ? _TextLink(
                url: link,
                text: text,
              )
            : Text(
                this.text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
      ],
    );
  }
}

class _TextLink extends StatelessWidget {
  final String url;
  final String text;

  _TextLink({@required this.text, @required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }
}

_launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}
