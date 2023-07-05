import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "asset/images/tshirt-2.jpg", Colors.green],
    ["Banana", "2.50", "asset/images/tshirt-2.jpg", Colors.yellow],
    ["Chicken", "12.80", "asset/images/tshirt-2.jpg", Colors.brown],
    ["Water", "1.00", "asset/images/tshirt-2.jpg", Colors.blue],
    ["Avocado", "4.00", "asset/images/tshirt-2.jpg", Colors.green],
    ["Banana", "2.50", "asset/images/tshirt-2.jpg", Colors.yellow],
    ["Chicken", "12.80", "asset/images/tshirt-2.jpg", Colors.brown],
    ["Water", "1.00", "asset/images/tshirt-2.jpg", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
