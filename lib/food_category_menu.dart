import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/restaurant_registration.dart';
import 'restaurant_registration.dart';

const borderColor = const Color(0XFFd83e56);

class Menu {
  final String optionsOnMenu;

  Menu(this.optionsOnMenu);
}

class DropdownScreen extends StatefulWidget {
  static FoodCategories foodCategories;
  State createState() => DropdownScreenState();
}

class DropdownScreenState extends State<DropdownScreen> {
  Menu selectedUser;
  FoodCategories chosenCategory(String s){
    if(s.compareTo('coffeehouse') == 0)
      return FoodCategories.COFFEEHOUSE;
    else if (s.compareTo('casual restaurant') == 0)
      return FoodCategories.CASUAL_RESTAURANT;
    else if(s.compareTo('fast food') == 0)
      return FoodCategories.FAST_FOOD;
    else if(s.compareTo('pizza') == 0)
      return FoodCategories.PIZZA;
    return FoodCategories.BREAKFAST;
  }
  List<Menu> menu = [
    Menu('coffeehouse'),
    Menu('casual restaurant'),
    Menu('fast food'),
    Menu('pizza'),
    Menu('breakfast'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            'food category',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 15.0,
            ),
          ),
        ),
        trailing: DropdownButton<Menu>(
          hint: Text("food category"),
          value: selectedUser,
          onChanged: (Menu value) {
            setState(() {
              selectedUser = value;
             DropdownScreen.foodCategories = chosenCategory(value.optionsOnMenu);
            });
          },
          items: menu.map((Menu menu) {
            return DropdownMenuItem<Menu>(
              value: menu,
              child: Text(
                menu.optionsOnMenu,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
