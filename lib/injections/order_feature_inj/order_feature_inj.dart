import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/injections/injections.dart';

abstract class OrderFeatureInj {
  static Future<void> orderFeatureInj() async {
    locator.registerLazySingleton<OrderFeatureBloc>(
      () => OrderFeatureBloc(),
    );
  }
}
