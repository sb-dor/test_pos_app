import 'package:flutter/foundation.dart';

@immutable
class CategoryModel {
  const CategoryModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory CategoryModel.fromDb(Map<String, dynamic> json) => CategoryModel();
}
