import 'package:common_codes/modules/foods.dart';

class Menu{
  List<Food> menu = [
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'New york Pizza', price: 98900),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Chicken Alfredo Pizza', price: 77900),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Sprite', price: 7100),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Cola', price: 7100),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Cola', price: 7100),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Cola', price: 7100),
    Food(imageAsset: 'assets/images/noPic.jpg', name: 'Cola', price: 7100),
  ];

  void addToMenu(Food food){
    menu.add(food);
  }
}