import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<ProductInfo, int> _cart = {};

  Map<ProductInfo, int> get cart => _cart;

  void addToCart(ProductInfo p) {import 'package:flutter/material.dart';
import 'package:flutterapp/products/product.dart';
import 'package:flutterapp/products/productInfo.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<ProductInfo, int> _cart = {};

  Map<ProductInfo, int> get cart => _cart;

  void addToCart(ProductInfo p) {
    if (_cart.containsKey(p)) {
      _cart[p] += 1;
    } else {
      _cart[p] = 1;
    }
    notifyListeners();
  }

  void clear(ProductInfo index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}
    if (_cart.containsKey(p)) {
      _cart[p] += 1;
    } else {
      _cart[p] = 1;
    }
    notifyListeners();
  }

  void clear(ProductInfo index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }
}