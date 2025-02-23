import 'package:flutter/foundation.dart';

final class ReusableFunctions {
  static ReusableFunctions? _instance;

  static ReusableFunctions get instance => _instance ??= ReusableFunctions._();

  ReusableFunctions._();

  bool get isDesktop =>
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
}
