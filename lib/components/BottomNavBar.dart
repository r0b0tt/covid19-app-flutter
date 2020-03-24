import 'package:covid19/resources/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
