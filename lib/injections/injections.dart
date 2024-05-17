import 'package:get_it/get_it.dart';
import 'package:test_pos_app/core/local_database_service/local_database_service.dart';
import 'package:test_pos_app/injections/order_feature_inj/order_feature_inj.dart';

final locator = GetIt.instance;

abstract class Injections {
  static Future<void> injector() async {
    await OrderFeatureInj.orderFeatureInj();

    locator.registerLazySingleton<LocalDatabaseService>(() => LocalDatabaseService());

    await locator<LocalDatabaseService>().initDatabase();
  }
}
