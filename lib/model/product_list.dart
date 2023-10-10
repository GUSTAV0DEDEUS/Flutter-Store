import 'package:flutter/material.dart';
import 'package:store/data/dummy_data.dart';
import 'package:store/model/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}