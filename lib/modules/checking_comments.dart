import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckingComments {
  String _comment;
  DateTime _dateTime;
  String _point;
  String _confirmText;
  IconData _confirmIcon;
  Color _confirmColor;
  bool _confirmed;
  String _buttonText;
  String _response;

  CheckingComments(
      this._comment,
      this._dateTime,
      this._point,
      this._confirmColor,
      this._confirmIcon,
      this._confirmText,
      this._confirmed,
      this._buttonText,
      this._response);

  String get response => _response;

  String get buttonText => _buttonText;

  set response(String value) {
    _response = value;
  }

  set buttonText(String value) {
    _buttonText = value;
  }

  DateTime get dateTime => _dateTime;

  set confirmed(bool value) {
    _confirmed = value;
  }

  set confirmIcon(IconData value) {
    _confirmIcon = value;
  }

  set confirmText(String value) {
    _confirmText = value;
  }

  set confirmColor(Color value) {
    _confirmColor = value;
  }

  bool get confirmed => _confirmed;

  String get confirmText => _confirmText;

  Color get confirmColor => _confirmColor;

  IconData get confirmIcon => _confirmIcon;

  String get comment => _comment;

  String get point => _point;
}

class CheckingCommentsList {
  List<CheckingComments> _checkingCommentsList = [
    CheckingComments(
        'dfheheheheaheahaehaessii  uguyfu yuyf fyg uyf yfytiwtitv qywiyusygidiuwwytiw wtyw4iutity  yruieiufiwyiywiuyweuri wuwewiit wehgweifgwuitgi  2gi ',
        DateTime.now(),
        '5.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheaheahaehaessii  uguyfu yuyf fyg uyf yf',
        DateTime.now(),
        '4.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheaheahaeha   essii  uguyfu yuyf fyg uyf yf',
        DateTime.now(),
        '3.5',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheah   eahaehaessii  uguyfu yuyf fyg uyf yf',
        DateTime.now().subtract(Duration(days: 10)),
        '5.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheah    eahaehaessii  ug    uyfu yuyf fyg uyf yf',
        DateTime.now().subtract(Duration(days: 10)),
        '5.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheahe   ahaehaessii  uguyfu yuyf fyg uyf yf',
        DateTime.now().subtract(Duration(days: 10)),
        '4.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheheaheahaehaessii  uguyfu yuyf fyg uyf yf',
        DateTime.now().subtract(Duration(days: 5)),
        '3.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
    CheckingComments(
        'dfheheheh   eaheahaehaessii  uguyfu yuyf fyg uyf yf',
        DateTime.now().subtract(Duration(days: 5)),
        '5.0',
        Colors.red,
        Icons.dangerous,
        'not confirmed',
        false,
        'answer',
        ''),
  ];

  List<CheckingComments> get checkingCommentsList => _checkingCommentsList;

  List<CheckingComments> showCommentsByDateOrder(DateTime dateTime) {
    List<CheckingComments> orderedList = List.empty(growable: true);
    for (int i = 0; i < checkingCommentsList.length; i++) {
      if (checkingCommentsList[i].dateTime.year == dateTime.year &&
          checkingCommentsList[i].dateTime.month == dateTime.month &&
          checkingCommentsList[i].dateTime.day == dateTime.day)
        orderedList.add(checkingCommentsList[i]);
    }
    return orderedList;
  }
}
