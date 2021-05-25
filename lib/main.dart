import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/bottomTabs.dart';
import 'package:restaurant_app/screens/checking_comments_screen.dart';
import 'package:restaurant_app/screens/editing_menu.dart';
import 'package:restaurant_app/screens/map.dart';
import 'package:restaurant_app/screens/restaurant_services.dart';
import 'package:common_codes/screens/welcome_screen.dart';
import 'package:restaurant_app/screens/scope_of_submission.dart';
import 'screens/login_screen.dart';
import 'screens/restaurant_registration.dart';
import 'screens/orders_detail_screen.dart';


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
        CheckingCommentsScreen.checkingCommentsId : (context) => CheckingCommentsScreen(),
        WelcomeScreen.welcomeScreenId : (context) => WelcomeScreen(registrationRouteName: RestaurantRegistrationScreen.restaurantRegistrationId,loginRouteName: LoginScreen.loginScreenId),
        LoginScreen.loginScreenId : (context) => LoginScreen(),
        RestaurantRegistrationScreen.restaurantRegistrationId: (context) => RestaurantRegistrationScreen(),
        RestaurantServices.restaurantServicesId : (context) => RestaurantServices(),
        BottomTabs.bottomTabsId : (context) => BottomTabs(),
        OrdersDetailScreen.ordersDetailScreenId : (context) => OrdersDetailScreen(),
        Map.MapId : (context) => Map(),
        ScopeOfSubmission.scopeOfSubmissionId : (context) => ScopeOfSubmission(),
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



