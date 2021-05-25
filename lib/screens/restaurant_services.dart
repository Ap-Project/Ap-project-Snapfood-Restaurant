import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:restaurant_app/screens/checking_comments_screen.dart';
import 'package:restaurant_app/screens/editing_menu.dart';
import 'package:restaurant_app/screens/orders_detail_screen.dart';
import 'package:restaurant_app/screens/scope_of_submission.dart';

const optionsHeight = 100.0;
const optionsWidth = 150.0;
const optionsColor = const Color(0XFF371c5a);
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, ScopeOfSubmission.scopeOfSubmissionId);
              });
            },
            child: ReusableContainer(
              height: 120,
              width: size.width,
              color: optionsColor,
              childDesign: ContainerDesign(
                optionIcon: Icons.motorcycle_rounded,
                optionText: "Scope of submission",
              ),
            ),
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
                    Navigator.pushNamed(
                        context, CheckingCommentsScreen.checkingCommentsId);
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(
                        context, OrdersDetailScreen.ordersDetailScreenId);
                  });
                },
                child: ReusableContainer(
                    height: optionsHeight,
                    width: optionsWidth,
                    color: optionsColor,
                    childDesign: ContainerDesign(
                      optionIcon: Icons.event_note_outlined,
                      optionText: 'Orders history',
                    )),
              ),
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
