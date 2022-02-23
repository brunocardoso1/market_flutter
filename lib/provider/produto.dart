import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:market_flutter/data/market_data.dart';
import 'package:market_flutter/models/products.dart';

class Produtos with ChangeNotifier {
  Map<String, Products> _items = {...DUMMY_PRODUCT};

  List<Products> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Products byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Products produto) {
    if (produto == null) {
      notifyListeners();
      return;
    }

    if (produto.id != null &&
        produto.id.trim().isNotEmpty &&
        _items.containsKey(produto.id)) {
      _items.update(
          produto.id,
          (_) => Products(
              id: produto.id,
              productName: produto.productName,
              valor: produto.valor,
              productPhoto: produto.productPhoto));
    } else {
      //adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Products(
                id: id,
                productName: produto.productName,
                valor: produto.valor,
                productPhoto: produto.productPhoto,
              ));
    }
    notifyListeners();
  }

  void remove(Products produto) {
    if (produto != null && produto.id != null) {
      _items.remove(produto.id);
      notifyListeners();
    }
  }
}
