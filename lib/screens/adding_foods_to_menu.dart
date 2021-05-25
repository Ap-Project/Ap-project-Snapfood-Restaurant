import 'package:common_codes/modules/foods.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/screens/decoration.dart';
import 'package:restaurant_app/modules/menu.dart';

class AddingFoods extends StatefulWidget {
  final Menu menu;

  AddingFoods(this.menu);

  static String addingFoodsId = '/AddingFoods';

  @override
  _AddingFoodsState createState() => _AddingFoodsState();
}

class _AddingFoodsState extends State<AddingFoods> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String foodName = '';
    double foodPrice = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding foods"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: myDecoration.TextFormFieldDecoration(
                    'Enter Food\'s name',
                    'Food\'s name',
                  ),
                  onSaved: (value) {
                    foodName = value;
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: myDecoration.TextFormFieldDecoration(
                      'Enter food\'s price', 'Food\'s price'),
                  onSaved: (value) {
                    foodPrice = double.parse(value);
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
                        'Add food',
                      ),
                      minWidth: 200.0,
                      height: 42.0,
                      onPressed: () {
                        setState(() {
                          _formKey.currentState.save();
                          widget.menu.addToMenu(Food(
                              imageAsset: '', name: foodName, price: foodPrice));
                          print(widget.menu.menu.length);
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
