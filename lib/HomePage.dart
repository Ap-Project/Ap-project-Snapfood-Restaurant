import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_list/showDetails.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  bool checkBoxValue = false;
  String oldImage = '';
  String oldName = '';
  int oldPrice = 0;

  changes(String newImage, int newPrice, String newName) {
    setState(() {
      newName = oldName;
      newPrice = oldPrice;
      newImage = oldImage;
    });
  }

  Widget categoriesContainer({@required String image, @required String name}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image)), //?
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        )
      ],
    );
  }

  Widget bottomContainer(
      {@required String image, @required int price, @required String name}) {
    return Container(
      height: 270,
      width: 220,
      decoration: BoxDecoration(
        color: Color(0xff3a3e3e),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(oldImage = image),
            radius: 60,
          ),
          ListTile(
            leading: Text(
              oldName = name,
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            trailing: Text(
              '\$ ${oldPrice = price}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Checkbox(
              activeColor: Colors.deepOrange,
              value: checkBoxValue,
              onChanged: (bool value) {
                setState(() {
                  checkBoxValue = value;
                });
              }),
          FlatButton(
            splashColor: Colors.orange,
            child: Text(
              'Show Details',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => showDetails()),
              );
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //? safe area
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black45,
          elevation: 0.0,
          title: Text('Menu'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  size: 26,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search Food",
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    filled: true,
                    fillColor: Color(0xff3a3e3e),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoriesContainer(image: '.png', name: ' All '),
                    categoriesContainer(image: '.png', name: 'BFast'),
                    categoriesContainer(image: '.png', name: 'Dinner'),
                    categoriesContainer(image: '.png', name: 'Lunch'),
                    categoriesContainer(image: '.png', name: 'Desert'),
                    categoriesContainer(image: '.png', name: 'Drink'),
                    categoriesContainer(image: '.png', name: 'Salad'),
                    categoriesContainer(image: '.png', name: 'Indian'),
                    categoriesContainer(image: '.png', name: 'Turkish'),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 510,
                child: GridView.count(
                  shrinkWrap: false,
                  primary: false,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    bottomContainer(image: '', price: 25, name: 'Burger'),
                    bottomContainer(image: '', price: 60, name: 'Pizza'),
                    bottomContainer(image: '', price: 10, name: 'Rice'),
                    bottomContainer(image: '', price: 20, name: 'HotDog'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}