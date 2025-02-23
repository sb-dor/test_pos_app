import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/src/common/global_usages/constants/constants.dart';
import 'package:test_pos_app/src/common/models/category_model.dart';
import 'package:test_pos_app/src/common/models/place_model.dart';
import 'package:test_pos_app/src/common/models/product_model.dart';
import 'package:test_pos_app/src/common/models/waiter_model.dart';

abstract class GlobalData {
  static const WaiterModel currentWaiter = WaiterModel(id: 1, name: "Andrew Tate");

  static List<PlaceModel> places = [
    PlaceModel(
      id: 1,
      name: Constants.mainHall,
      vip: false,
      icon: const Icon(Icons.list_alt, color: Colors.blue),
      color: Colors.amberAccent.shade100,
    ),
    PlaceModel(
      id: 2,
      name: Constants.letka,
      vip: false,
      icon: const Icon(Icons.list_alt, color: Colors.blue),
      color: Colors.amberAccent.shade100,
    ),
    PlaceModel(
      id: 3,
      name: Constants.vip1,
      vip: true,
      icon: const Icon(Icons.list_alt, color: Colors.blue),
      color: Colors.amberAccent.shade100,
    ),
    PlaceModel(
      id: 4,
      name: Constants.vip2,
      vip: true,
      icon: const Icon(Icons.print, color: Colors.blue),
      color: Colors.blue.shade100,
    ),
  ];

  static const List<CategoryModel> categories = [
    CategoryModel(id: 1, name: Constants.firstFoods),
    CategoryModel(id: 2, name: Constants.secondFoods),
  ];

  static List<ProductModel> products = [
    ProductModel(
      id: 1,
      category: categories[0],
      name: "Жаранный кортофель",
      price: 10,
    ),
    ProductModel(
      id: 2,
      category: categories[1],
      name: "Картафан",
      price: 12,
    ),
    ProductModel(
      id: 3,
      category: categories[0],
      name: "Laptop",
      price: 15,
    ),
    ProductModel(
      id: 4,
      category: categories[1],
      name: "Липтон",
      price: 11,
    ),
    ProductModel(
      id: 5,
      category: categories[1],
      name: "Чизбургер",
      price: 9,
    ),
    ProductModel(
      id: 6,
      category: categories[1],
      name: "Шаверма",
      price: 23,
    ),
    ProductModel(
      id: 7,
      category: categories[1],
      name: "Биг тейсти",
      price: 32,
    ),
    ProductModel(
      id: 8,
      category: categories[1],
      name: "SMS MMS",
      price: 30,
    ),
    ProductModel(
      id: 9,
      category: categories[0],
      name: "Продукт",
      price: 14,
    ),
  ];
}
