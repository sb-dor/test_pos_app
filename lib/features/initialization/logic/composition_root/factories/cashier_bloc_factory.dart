import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:test_pos_app/features/cashier_feature/bloc/cashier_feature_bloc.dart';
import 'package:test_pos_app/features/cashier_feature/data/cashier_feature_data_source.dart';
import 'package:test_pos_app/features/cashier_feature/data/cashier_feature_repo.dart';
import 'package:test_pos_app/features/initialization/logic/composition_root/composition_root.dart';

final class CashierBlocFactory extends Factory<CashierFeatureBloc> {
  CashierBlocFactory({
    required final AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;

  @override
  CashierFeatureBloc create() {
    final ICashierFeatureDataSource datasource = CashierFeatureDataSourceImpl(
      appDatabase: _appDatabase,
    );

    final ICashierFeatureRepo repo = CashierFeatureRepoImpl(datasource);

    return CashierFeatureBloc(cashierFeatureRepo: repo);
  }
}
