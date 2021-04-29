import 'package:flutter/material.dart';
import 'restaurant_services.dart';
import 'dashboard.dart';
import 'ordering.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> screenList = [
    RestaurantServices(),
    Ordering(),
    Dashboard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.border_all_rounded,
            ),
            title: Text('services'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color),
            title: Text('ordering'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            title: Text('dashboard'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
