import 'shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // list of shoes for saleF
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Air Jordan',
        price: '236',
        imagePath: 'lib/images/AirJordanOne.jpg',
        description:
            'The forward-thinking design of his latest signature shoe.'),
    Shoe(
        name: 'All Star',
        price: '245',
        imagePath: 'lib/images/AllStar.jpg',
        description: 'The shoe made for comfort'),
    Shoe(
        name: 'Black Nike',
        price: '205',
        imagePath: 'lib/images/BlackNike.jpg',
        description: "One of Nike's best shoes."),
    Shoe(
        name: 'Black Shoe',
        price: '236',
        imagePath: 'lib/images/HighLoafer.jpg',
        description: 'Loafers designed just for you.')
  ];
  // list of items in user cart
  List<Shoe> userCart = [];
  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

// add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
