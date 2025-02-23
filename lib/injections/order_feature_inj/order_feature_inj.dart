import 'package:test_pos_app/features/order_feature/data/repo/order_feature_repo_impl.dart';
import 'package:test_pos_app/features/order_feature/data/sources/order_feature_source/impl/order_feature_source_impl.dart';
import 'package:test_pos_app/features/order_feature/data/order_feature_source.dart';
import 'package:test_pos_app/features/order_feature/data/order_feature_repo.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/injections/injections.dart';

abstract class OrderFeatureInj {
  static Future<void> orderFeatureInj() async {
    locator.registerLazySingleton<IOrderFeatureSource>(() => OrderFeatureSourceImpl(),);

    locator.registerLazySingleton<IOrderFeatureRepo>(
      () => OrderFeatureRepoImpl(
        locator<IOrderFeatureSource>(),
      ),
    );

    locator.registerLazySingleton<OrderFeatureBloc>(
      () => OrderFeatureBloc(orderFeatureRepo: locator<IOrderFeatureRepo>()),
    );
  }
}
