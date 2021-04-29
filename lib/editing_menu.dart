import 'package:flutter/material.dart';

class EditingMenu extends StatefulWidget {
  @override
  _EditingMenuState createState() => _EditingMenuState();
}

class _EditingMenuState extends State<EditingMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing menu'),
      ),
    );
  }
}
