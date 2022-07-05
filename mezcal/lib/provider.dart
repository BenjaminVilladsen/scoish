import 'package:flutter/material.dart';
import 'orderpage.dart';

class ShoppingCart with ChangeNotifier {
  final List<Product> _shoppingList = [];
  List<Product> get shoppingList => _shoppingList;
  void addProduct(Product product) {
    _shoppingList.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _shoppingList.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _shoppingList.clear();
    notifyListeners();
  }
}
