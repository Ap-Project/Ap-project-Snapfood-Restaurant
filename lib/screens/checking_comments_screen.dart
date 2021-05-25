import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/checking_comments.dart';
import 'package:intl/intl.dart';
import 'package:common_codes/screens/decoration.dart';
import 'comments_response_screen.dart';

const button = const Color(0XFFd83e56);

class CheckingCommentsScreen extends StatefulWidget {
  static String checkingCommentsId = '/CheckingComments';

  @override
  _CheckingCommentsScreenState createState() => _CheckingCommentsScreenState();
}

class _CheckingCommentsScreenState extends State<CheckingCommentsScreen> {
  DateTime _dateTime = DateTime.now();
  CheckingCommentsList checkingCommentsList = new CheckingCommentsList();
  int countIconChanges = 0;
  Color textColor = Colors.white;
  Color elevatedButton = buttonColor;
  String text = 'answer';


  @override
  Widget build(BuildContext context) {
    List<CheckingComments> newOrderedList = checkingCommentsList.showCommentsByDateOrder(_dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checking comments'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.mail),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: IconButton(
                      icon: Icon(Icons.arrow_drop_down),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((date) {
                          setState(() {
                            _dateTime = date;
                          });
                        });
                      }),
                  title: Text(DateFormat('EEEE, d MMM, yyyy').format(_dateTime)),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newOrderedList.length,
                  itemBuilder: (context, index) {
                    void change(String viewText){
                      setState(() {
                        newOrderedList.elementAt(index).buttonText = viewText;
                      });
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(
                                    newOrderedList.elementAt(index).comment,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(DateFormat('EEEE, d MMM, yyyy').format(_dateTime),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(DateFormat('hh:mm').format(_dateTime),
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: Icon(
                                  newOrderedList.elementAt(index).confirmIcon,
                                  color: newOrderedList.elementAt(index).confirmColor,
                                ),
                                title: Text(newOrderedList.elementAt(index).confirmText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: newOrderedList.elementAt(index).confirmColor,
                                  ),
                                ),
                                trailing: Container(
                                  height: 30.0,
                                  width: 50.0,
                                  child: Center(child: myTextStyle(text: newOrderedList.elementAt(index).point,textColor: Colors.white,)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.green,
                                  ),
                                ),
                                onTap: (){
                                  setState(() {
                                    if(countIconChanges == 0){
                                      newOrderedList.elementAt(index).confirmIcon = Icons.check_circle;
                                      newOrderedList.elementAt(index).confirmText = 'confirmed';
                                      newOrderedList.elementAt(index).confirmColor = Colors.green;
                                      countIconChanges = 1;
                                    }
                                    else{
                                      newOrderedList.elementAt(index).confirmIcon =Icons.dangerous;
                                      newOrderedList.elementAt(index).confirmText = 'not confirmed';
                                      newOrderedList.elementAt(index).confirmColor = Colors.red;
                                      countIconChanges = 0;
                                    }
                                    newOrderedList.elementAt(index).confirmed = ! newOrderedList.elementAt(index).confirmed;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CommentResponseScreen(change,newOrderedList.elementAt(index))));
                                  },
                                  child: Text(newOrderedList.elementAt(index).buttonText),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateColor.resolveWith(
                                          (states) => buttonColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: myDecoration.myBoxDecoration(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
