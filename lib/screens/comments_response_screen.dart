import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:restaurant_app/modules/checking_comments.dart';

const button = const Color(0XFFd83e56);

class CommentResponseScreen extends StatefulWidget {
  static String commentResponseScreenId = 'commentResponseScreen';
  final Function change;
  CheckingComments checkingComments;

  CommentResponseScreen(this.change, this.checkingComments);

  @override
  _CommentResponseScreenState createState() => _CommentResponseScreenState();
}

class _CommentResponseScreenState extends State<CommentResponseScreen> {
  final formKey = GlobalKey<FormState>();
  String response = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Comment Response'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Card(
              child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: size.width - 20,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        leading: Icon(Icons.comment),
                        title: Text(
                          widget.checkingComments.comment,
                          style: TextStyle(
                            height: 2.0,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: button),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: MyTextStyle(
                    text: 'Response :',
                  ),
                  title: Text(widget.checkingComments.response),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      response = value;
                    },
                    validator: (value) {
                      if (value.isEmpty || value == null)
                        return 'Please enter your response';
                      return null;
                    },
                    decoration: myDecoration.TextFormFieldDecoration(
                        'your response', 'reply'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (formKey.currentState.validate()) {
                            widget.change('view answer');
                            formKey.currentState.save();
                            widget.checkingComments.response = response;
                          }
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => buttonColor),
                      ),
                      child: Text('send')),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
