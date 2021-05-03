import 'package:flutter/material.dart';
import 'package:restaurant_app/bottomTabs.dart';
import 'package:restaurant_app/checking_comments.dart';
import 'package:restaurant_app/editing_menu.dart';
import 'package:restaurant_app/restaurant_services.dart';
import 'package:common_codes/screens/welcome_screen.dart';
import 'login_screen.dart';
import 'restaurant_registration.dart';
import 'bottomTabs.dart';

void main() {
  runApp(RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.welcomeScreenId,
      routes: {
        EditingMenu.editingMenuId: (context) => EditingMenu(),
        CheckingComments.checkingCommentsId : (context) => CheckingComments(),
        WelcomeScreen.welcomeScreenId : (context) => WelcomeScreen(registrationRouteName: RestaurantRegistrationScreen.restaurantRegistrationId,loginRouteName: LoginScreen.loginScreenId),
        LoginScreen.loginScreenId : (context) => LoginScreen(),
        RestaurantRegistrationScreen.restaurantRegistrationId: (context) => RestaurantRegistrationScreen(),
        RestaurantServices.restaurantServicesId : (context) => RestaurantServices(),
        BottomTabs.bottomTabsId : (context) => BottomTabs(),
      },
      title: 'SnapFood',
      theme: ThemeData(
        primaryColor: const Color(0XFFd83e56),
        accentColor: const Color(0XFFd83e56),
      ),
      // home: BottomTabs(),
    );
  }
}



