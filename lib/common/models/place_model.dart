import 'package:flutter/material.dart';

@immutable
class PlaceModel {
  const PlaceModel({
    this.id,
    this.name,
    this.vip,
    this.icon,
    this.color,
  });

  final int? id;
  final String? name;
  final bool? vip;

  final Widget? icon;
  final Color? color;

  factory PlaceModel.fromDb(Map<String, dynamic> db) => PlaceModel();
}
