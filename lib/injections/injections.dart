import 'package:get_it/get_it.dart';
import 'package:test_pos_app/injections/order_feature_inj/order_feature_inj.dart';

final locator = GetIt.instance;

abstract class Injections {
  static Future<void> injector() async {
    await OrderFeatureInj.orderFeatureInj();
  }
}
