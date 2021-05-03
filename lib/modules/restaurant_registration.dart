
enum FoodCategories{
  COFFEEHOUSE,
  CASUAL_RESTAURANT,
  FAST_FOOD,
  PIZZA,
  BREAKFAST,
}
class RestaurantRegistration{
  String _restaurantName;
  String _restaurantAddress;
  FoodCategories _foodCategories;
  String phoneNumber;
  String password;
  RestaurantRegistration(this._restaurantName,this._restaurantAddress,this._foodCategories,this.phoneNumber,this.password);

  //ignore: unnecessary_getters_setters
  set restaurantName(String value) {
    _restaurantName = value;
  }

  // ignore: unnecessary_getters_setters
  set foodCategories(FoodCategories value) {
    _foodCategories = value;
  }

  // ignore: unnecessary_getters_setters
  set restaurantAddress(String value) {
    _restaurantAddress = value;
  }

  // ignore: unnecessary_getters_setters
  String get restaurantAddress => _restaurantAddress;

  // ignore: unnecessary_getters_setters
  FoodCategories get foodCategories => _foodCategories;

  // ignore: unnecessary_getters_setters
  String get restaurantName => _restaurantName;
}