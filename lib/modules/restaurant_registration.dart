import 'package:latlong2/latlong.dart';

enum FoodCategories{
  COFFEEHOUSE,
  CASUAL_RESTAURANT,
  FAST_FOOD,
  PIZZA,
  BREAKFAST,
  Italian,
  Persian,
}

class RestaurantRegistration{
  String _restaurantName;
  String _restaurantAddress;
  FoodCategories _foodCategories;
  String phoneNumber;
  String password;
  LatLng latLng;
  RestaurantRegistration(this._restaurantName,this._restaurantAddress,this._foodCategories,this.phoneNumber,this.password,{this.latLng});


  set restaurantName(String value) {
    _restaurantName = value;
  }


  set foodCategories(FoodCategories value) {
    _foodCategories = value;
  }


  set restaurantAddress(String value) {
    _restaurantAddress = value;
  }


  String get restaurantAddress => _restaurantAddress;


  FoodCategories get foodCategories => _foodCategories;

  String get restaurantName => _restaurantName;
}