import 'package:test_pos_app/core/global_models/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({super.id, super.name});

  factory CategoryModel.fromDb(Map<String, dynamic> json) => CategoryModel();
}
