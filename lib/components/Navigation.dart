import 'package:covid19/assets/app_colors.dart';
import 'package:covid19/screens/About.dart';
import 'package:covid19/screens/Countries.dart';
import 'package:covid19/screens/FAQs.dart';
import 'package:covid19/screens/Home.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final routes = [Home(), Countries(), Faqs(), About()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Covid-19",
            style: TextStyle(
              color: AppColors.PRIMARY,
              fontSize: 16,
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: Image(
            image: AssetImage('assets/images/icon.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: routes[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text('Countries'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text('FAQs'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.BLUE,
        onTap: _onItemTapped,
      ),
    );
  }
}
