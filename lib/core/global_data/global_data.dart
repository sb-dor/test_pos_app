import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_models/entities/category.dart';
import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/core/global_models/entities/product.dart';
import 'package:test_pos_app/core/global_models/entities/waiter.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';

abstract class GlobalData {
  static const Waiter currentWaiter = Waiter(id: 1, name: "Andrew Tate");

  static List<Place> places = [
    const Place(id: 1, name: Constants.mainHall, vip: false),
    const Place(id: 2, name: Constants.letka, vip: false),
    Place(
      id: 3,
      name: Constants.vip1,
      vip: true,
      icon: const Icon(Icons.list_alt, color: Colors.blue),
      color: Colors.amberAccent.shade100,
    ),
    Place(
      id: 4,
      name: Constants.vip2,
      vip: true,
      icon: const Icon(Icons.print, color: Colors.blue),
      color: Colors.blue.shade100,
    ),
  ];

  static const List<Category> categories = [
    Category(id: 1, name: Constants.firstFoods),
    Category(id: 2, name: Constants.secondFoods),
  ];

  static List<Product> products = [
    Product(
      id: 1,
      category: categories[0],
      name: "Жаранный кортофель",
      price: 10,
    ),
    Product(
      id: 2,
      category: categories[1],
      name: "Картафан",
      price: 12,
    ),
    Product(
      id: 3,
      category: categories[0],
      name: "Laptop",
      price: 15,
    ),
    Product(
      id: 4,
      category: categories[1],
      name: "Липтон",
      price: 11,
    ),
    Product(
      id: 5,
      category: categories[1],
      name: "Чизбургер",
      price: 9,
    ),
    Product(
      id: 6,
      category: categories[1],
      name: "Шаверма",
      price: 23,
    ),
    Product(
      id: 7,
      category: categories[1],
      name: "Биг тейсти",
      price: 32,
    ),
    Product(
      id: 8,
      category: categories[1],
      name: "SMS MMS",
      price: 30,
    ),
    Product(
      id: 9,
      category: categories[0],
      name: "Продукт",
      price: 14,
    ),
  ];
}
