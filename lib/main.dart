import 'package:flutter/material.dart';
import 'package:restaurant_app/checking_comments.dart';
import 'package:restaurant_app/editing_menu.dart';
import 'bottomTabs.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/EditingMenu': (context) => EditingMenu(),
        '/CheckingComments' : (context) => CheckingComments(),
      },
      title: 'SnapFood',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: BottomTabs(),
    );
  }
}



