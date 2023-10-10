import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/model/card_item.dart';
import 'package:store/model/product.dart';

class Cart with ChangeNotifier {
  Map<String, CardItem> _items = {};
  Map<String, CardItem> get items {
    return {..._items};
  }

  int get itemsCount => _items.length;

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) => CardItem(
          id: existingItem.id,
          productId: existingItem.id,
          name: existingItem.name,
          quantity: existingItem.quantity + 1,
          price: existingItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        product.id,
        () => CardItem(
          id: Random().nextDouble().toString(),
          productId: product.id,
          name: product.name,
          quantity: 1,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cardItem) {
      total += cardItem.price * cardItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
