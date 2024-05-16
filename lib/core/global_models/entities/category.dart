import 'package:flutter/foundation.dart';

@immutable
class Category {
  final int? id;
  final String? name;

  const Category({
    required this.id,
    required this.name,
  });
}
