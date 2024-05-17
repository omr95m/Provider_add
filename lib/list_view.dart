import 'package:flutter/material.dart';
import 'package:staate/list_item.dart';

class Model with ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;
  add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();
  }

  remove(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _price;
  }

  List<Item> get basket {
    return _items;
  }
}
