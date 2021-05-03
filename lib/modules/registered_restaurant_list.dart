import 'restaurant_registration.dart';

class RegisteredRestaurantList {
  List<RestaurantRegistration> _registeredList = [
    RestaurantRegistration('sdgegh','sdgf',FoodCategories.CASUAL_RESTAURANT,'09129494168','ghazal1234'),
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