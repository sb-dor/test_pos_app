import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/product.dart';

class OrderItem {
  Product? product;
  double? price;
  double? qty;

  OrderItem({
    required this.product,
    required this.price,
    required this.qty,
  });
}
