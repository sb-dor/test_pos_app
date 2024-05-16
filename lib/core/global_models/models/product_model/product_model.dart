import 'package:test_pos_app/core/global_models/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    super.id,
    super.category,
    super.name,
    super.price,
  });

  factory ProductModel.fromDb(Map<String, dynamic> db) => ProductModel();
}
