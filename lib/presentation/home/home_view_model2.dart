import 'package:bimarestan/models/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel2 extends ChangeNotifier {
  int counter = 0;

  List<Order> orders = [
    Order(),
    Order(),
    Order(),
    Order(),
    Order(),
    Order(),
  ];

  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    counter--;
    notifyListeners();
  }

  void orderCopyWith(int index, Order Function(Order) getNewOrder) {
    final order = orders[index];
    final newOrderValue = getNewOrder(order);
    orders[index] = newOrderValue;
  }

  void init(Profile? profile) {}

  void submit(BuildContext context) {
    
  }
}

class Order {
  int index = 1;
}
