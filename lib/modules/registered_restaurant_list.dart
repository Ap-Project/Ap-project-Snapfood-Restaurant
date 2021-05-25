import 'package:latlong2/latlong.dart';

import 'restaurant_registration.dart';

class RegisteredRestaurantList {
  List<RestaurantRegistration> _registeredList = [
    RestaurantRegistration('Buono Restaurant','Tehran Province, Tehran, 2nd St, Iran',FoodCategories.Italian,'09129494168','Bouno1234'),
    RestaurantRegistration('Khoroos Fried Chicken','Tehran Province, Tehran, District 1, پلاک ۷۴/۳، Andarzgoo Blvd, Iran',FoodCategories.FAST_FOOD,'09129494167','Khoroos1234'),
    RestaurantRegistration('Lamiz Coffee','Tehran, District 3, Mirdamad Blvd, Iran',FoodCategories.COFFEEHOUSE,'09129494166','Lamiz1234'),
    RestaurantRegistration('Nayeb Restaurant','Tehran, St ,Vozara Ave, 11th, No. 30, Iran',FoodCategories.Persian,'09129494165','Nayeb1234'),
    RestaurantRegistration('The Cheese Factory','Ava Center, Movahed Danesh St.Tehran, Tehran',FoodCategories.Italian,'09129494164','Cheese1234',latLng: LatLng(35.804823, 51.47649)),

  ];

  void add(RestaurantRegistration r) {
    _registeredList.add(r);
  }

  List<RestaurantRegistration> getRegisteredList() {
    return _registeredList;
  }

  int phoneNumberExistence(String phone) {
    for (int i = 0; i < _registeredList.length; i++){
      if(_registeredList[i].phoneNumber.compareTo(phone) == 0){
        print(i);
        return i;}
    }
    return -1;
  }
  bool checkPassword(String password,int i){
    if (_registeredList[i].password.compareTo(password) == 0)
      return true;
    return false;
  }

}