import 'package:flutter/foundation.dart';
import 'package:test_pos_app/common/models/category_model.dart';

@immutable
class ProductModel {
  const ProductModel({
    this.id,
    this.category,
    this.name,
    this.price,
  });

  final int? id;
  final CategoryModel? category;
  final String? name;
  final double? price;

  factory ProductModel.fromDb(Map<String, dynamic> db) => ProductModel();
}
