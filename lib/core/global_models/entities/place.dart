import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
class Place {
  final int? id;
  final String? name;
  final bool? vip;

  final Widget? icon;
  final Color? color;

  const Place({
    required this.id,
    required this.name,
    required this.vip,
    this.icon,
    this.color,
  });
}
