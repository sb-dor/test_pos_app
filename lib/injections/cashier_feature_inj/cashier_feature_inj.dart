import 'package:test_pos_app/features/cashier_feature/data/repo/cashier_feature_repo_impl.dart';
import 'package:test_pos_app/features/cashier_feature/data/cashier_feature_data_source.dart';
import 'package:test_pos_app/features/cashier_feature/data/sources/cashier_feature_data_source/impl/cashier_feature_data_source_impl.dart';
import 'package:test_pos_app/features/cashier_feature/data/cashier_feature_repo.dart';
import 'package:test_pos_app/features/cashier_feature/view/bloc/cashier_feature_bloc.dart';
import 'package:test_pos_app/injections/injections.dart';

abstract class CashierFeatureInj {
  static Future<void> cashierFeatureInj() async {
    locator.registerLazySingleton<ICashierFeatureDataSource>(
      () => CashierFeatureDataSourceImpl(),
    );

    locator.registerLazySingleton<ICashierFeatureRepo>(
      () => CashierFeatureRepoImpl(
        locator<ICashierFeatureDataSource>(),
      ),
    );

    locator.registerLazySingleton<CashierFeatureBloc>(
      () => CashierFeatureBloc(
        cashierFeatureRepo: locator<ICashierFeatureRepo>(),
      ),
    );
  }
}
