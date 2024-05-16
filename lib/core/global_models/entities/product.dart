import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/category.dart' as cat;

@immutable
class Product {
  final int? id;
  final cat.Category? category;
  final String? name;
  final double? price;

  const Product({
    required this.id,
    required this.category,
    required this.name,
    required this.price,
  });
}
