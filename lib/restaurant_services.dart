import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant_app/checking_comments.dart';
import 'package:restaurant_app/editing_menu.dart';

const optionsHeight = 100.0;
const optionsWidth = 150.0;
const optionsColor = const Color(0xff1d1d39);
const optionsTextColor = Colors.white;
const optionIconColor = Colors.white;

class RestaurantServices extends StatefulWidget {
  static String restaurantServicesId = '/RestaurantServices';
  @override
  _RestaurantServicesState createState() => _RestaurantServicesState();
}

class _RestaurantServicesState extends State<RestaurantServices> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'Services',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.mail,
            ),
          ),
        ],
      ),
      // TODO :(1) put this column in SingleChildScrollView
      body: Column(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: ReusableContainer(
                height: 90, width: size.width, color: optionsColor),
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, EditingMenu.editingMenuId);
                  });
                },
                child: ReusableContainer(
                    height: optionsHeight,
                    width: optionsWidth,
                    color: optionsColor,
                    childDesign: ContainerDesign(
                        optionIcon: Icons.restaurant_menu,
                        optionText: 'Editing menu')),
              ),
              Spacer(),
              ReusableContainer(
                  height: optionsHeight,
                  width: optionsWidth,
                  color: optionsColor,
                  childDesign: ContainerDesign(
                    optionIcon: Icons.camera_alt_outlined,
                    optionText: 'Adding menu pics',
                  )),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, CheckingComments.checkingCommentsId);
                  });
                },
                child: ReusableContainer(
                    height: optionsHeight,
                    width: optionsWidth,
                    color: optionsColor,
                    childDesign: ContainerDesign(
                        optionIcon: Icons.comment,
                        optionText: 'Checking comments')),
              ),
              Spacer(),
              ReusableContainer(
                  height: optionsHeight,
                  width: optionsWidth,
                  color: optionsColor,
                  childDesign: ContainerDesign(
                    optionIcon: Icons.event_note_outlined,
                    optionText: 'Orders history',
                  )),
              Spacer(),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Spacer(),
              ReusableContainer(
                  height: optionsHeight,
                  width: optionsWidth,
                  color: optionsColor,
                  childDesign: ContainerDesign(
                    optionIcon: Icons.attach_money,
                    optionText: 'Accounting',
                  )),
              Spacer(),
            ],
          ),
        ],
      ),

    );
  }
}

class ReusableContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Widget childDesign;

  ReusableContainer({this.height, this.width, this.color, this.childDesign});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      child: childDesign,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 7.0,
            spreadRadius: 4.0,
            offset: Offset(0, 0),
          ),
        ],
      ),
    );
  }
}

class ContainerDesign extends StatelessWidget {
  final IconData optionIcon;
  final String optionText;

  ContainerDesign({this.optionIcon, this.optionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          optionIcon,
          size: 80.0,
          color: optionIconColor,
        ),
        Text(
          optionText,
          style: TextStyle(
            color: optionsTextColor,
            //TODO:(2) style the text
          ),
        )
      ],
    );
  }
}
