import 'package:flutter/material.dart';

class CheckingComments extends StatefulWidget {
  static String checkingCommentsId = '/CheckingComments';
  @override
  _CheckingCommentsState createState() => _CheckingCommentsState();
}

class _CheckingCommentsState extends State<CheckingComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking comments'),
      ),
    );
  }
}
