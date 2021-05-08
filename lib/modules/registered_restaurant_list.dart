import 'restaurant_registration.dart';

class RegisteredRestaurantList {
  List<RestaurantRegistration> _registeredList = [
    RestaurantRegistration('Buono Restaurant','Tehran Province, Tehran, 2nd St, Iran',FoodCategories.Italian,'09129494168','Bouno1234'),
    RestaurantRegistration('Khoroos Fried Chicken','Tehran Province, Tehran, District 1, پلاک ۷۴/۳، Andarzgoo Blvd, Iran',FoodCategories.FAST_FOOD,'09129494168','Khoroos1234'),
    RestaurantRegistration('Lamiz Coffee','Tehran, District 3, Mirdamad Blvd, Iran',FoodCategories.COFFEEHOUSE,'09129494168','Lamiz1234'),
    RestaurantRegistration('Nayeb Restaurant','Tehran, St ,Vozara Ave, 11th, No. 30, Iran',FoodCategories.Persian,'09129494168','Nayeb1234'),

  ];

  void add(RestaurantRegistration r) {
    _registeredList.add(r);
  }

  List<RestaurantRegistration> getRegisteredList() {
    return _registeredList;
  }

  int phoneNumberExistence(String phone) {
    for (int i = 0; i < _registeredList.length; i++){
      if(_registeredList[i].phoneNumber.compareTo(phone) == 0)
        return i;
    }
    print(phone);
    return -1;
  }
  bool checkPassword(String password,int i){
    if (_registeredList[i].password.compareTo(password) == 0)
      return true;
    return false;
  }

}