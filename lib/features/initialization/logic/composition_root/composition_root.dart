import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:test_pos_app/features/initialization/logic/composition_root/factories/cashier_bloc_factory.dart';
import 'package:test_pos_app/features/initialization/logic/composition_root/factories/order_bloc_factory.dart';
import 'package:test_pos_app/features/initialization/models/dependency_container.dart';

final class CompositionRoot extends AsyncFactory<CompositionResult> {
  CompositionRoot({
    required final AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;

  @override
  Future<CompositionResult> create() async {
    final dependencies = await DependenciesFactory(
      appDatabase: _appDatabase,
    ).create();

    return CompositionResult(dependencies);
  }
}

final class CompositionResult {
  CompositionResult(this.dependencyContainer);

  final DependencyContainer dependencyContainer;
}

final class DependenciesFactory extends AsyncFactory<DependencyContainer> {
  DependenciesFactory({
    required final AppDatabase appDatabase,
  }) : _appDatabase = appDatabase;

  final AppDatabase _appDatabase;

  @override
  Future<DependencyContainer> create() async {
    final orderFeatureBloc = OrderBlocFactory(appDatabase: _appDatabase).create();
    final cashierFeatureBloc = CashierBlocFactory(appDatabase: _appDatabase).create();

    return DependencyContainer(
      appDatabase: _appDatabase,
      orderFeatureBloc: orderFeatureBloc,
      cashierFeatureBloc: cashierFeatureBloc,
    );
  }
}

abstract class AsyncFactory<T> {
  Future<T> create();
}

abstract class Factory<T> {
  T create();
}
