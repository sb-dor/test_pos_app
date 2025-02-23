import 'package:test_pos_app/src/common/utils/database/app_database.dart';
import 'package:test_pos_app/src/features/initialization/logic/composition_root/composition_root.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/src/features/order_feature/data/order_feature_repo.dart';
import 'package:test_pos_app/src/features/order_feature/data/order_feature_source.dart';

final class OrderBlocFactory extends Factory<OrderFeatureBloc> {
  OrderBlocFactory({
    required final AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;

  @override
  OrderFeatureBloc create() {
    final IOrderFeatureSource datasource = OrderFeatureSourceImpl(
      appDatabase: _appDatabase,
    );

    final IOrderFeatureRepo repo = OrderFeatureRepoImpl(datasource);

    return OrderFeatureBloc(orderFeatureRepo: repo);
  }
}
