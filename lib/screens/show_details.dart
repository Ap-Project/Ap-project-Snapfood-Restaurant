import 'package:flutter/material.dart';
import 'package:common_codes/modules/foods.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:restaurant_app/screens/editing_menu.dart';

class ShowDetails extends StatefulWidget {
  final Function changeName;
  final Function changePrice;
  final Function changeImage;
  final Food food;

  ShowDetails(this.changeName,this.changePrice,this.changeImage,this.food);

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Show Details'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: myDecoration.TextFormFieldDecoration(
                    'Enter new Name',
                    'Food\'s name',
                  ),
                  onSaved: (String value) {
                    widget.food.name = value;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter new price', 'Food\'s price'),
                  onSaved: (String value) {
                    widget.food.price = double.parse(value);
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Material(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: MaterialButton(
                      child: Text(
                        'Save changes',
                      ),
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: () {
                          setState(() {
                            _formKey.currentState.save();
                            widget.changeName(widget.food.name);
                            widget.changePrice(widget.food.price);
                          });
                          // Navigator.pushNamed(
                          //     context, BottomTabs.bottomTabsId);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
