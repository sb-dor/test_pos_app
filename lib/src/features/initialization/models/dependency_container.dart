import 'package:test_pos_app/src/common/utils/database/app_database.dart';
import 'package:test_pos_app/src/features/cashier_feature/bloc/cashier_feature_bloc.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_bloc.dart';

class DependencyContainer {
  //
  DependencyContainer({
    required this.appDatabase,
    required this.orderFeatureBloc,
    required this.cashierFeatureBloc,
  });

  final AppDatabase appDatabase;

  final OrderFeatureBloc orderFeatureBloc;

  final CashierFeatureBloc cashierFeatureBloc;
}
