import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_codes/modules/foods.dart';
import 'package:restaurant_app/modules/menu.dart';
import 'package:common_codes/screens/search.dart';
import 'package:common_codes/screens/TopMenus.dart';
import 'package:restaurant_app/screens/adding_foods_to_menu.dart';
import 'package:restaurant_app/screens/show_details.dart';

const button = const Color(0XFFd83e56);

class EditingMenu extends StatefulWidget {
  static String editingMenuId = '/EditingMenu';

  @override
  _EditingMenuState createState() => _EditingMenuState();
}

class _EditingMenuState extends State<EditingMenu> {
  Menu menu = new Menu();

  void addingFood(Food food) {
    setState(() {
      menu.menu.add(food);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w600, letterSpacing: 1.2),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
              setState(() {
               Navigator.push(context,  MaterialPageRoute(builder: (context) => AddingFoods(menu)));
              });
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            SearchWidget(),
            TopMenus(),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menu.menu.length,
                itemBuilder: (context, index) {
                  print(menu.menu.length);
                  void changeName(String newName) {
                    menu.menu.elementAt(index).name = newName;
                  }

                  void changePrice(double newPrice) {
                    menu.menu.elementAt(index).price = newPrice;
                  }

                  void changeImage(String newImageAsset) {
                    menu.menu.elementAt(index).imageAsset = newImageAsset;
                  }

                  return _buildMenuItem(menu.menu.elementAt(index), index,
                      changeName, changePrice, changeImage);
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(Food food, int index, Function changeName,
      Function changePrice, Function changeImage) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(food.imageAsset),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 175.0,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black87.withOpacity(0.3),
                      Colors.black54.withOpacity(0.3),
                      Colors.black38.withOpacity(0.3),
                    ],
                    stops: [
                      0.1,
                      0.5,
                      0.7,
                      0.9
                    ]),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                food.name,
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
              Text(
                '${food.price}',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
            ],
          ),
          Positioned(
            top: 135.0,
            right: 25.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowDetails(
                            changeName,
                            changePrice,
                            changeImage,
                            menu.menu.elementAt(index))));
              },
              child: Text("Show details"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => button),
              ),
            ),
          )
        ],
      ),
    );
  }
}
