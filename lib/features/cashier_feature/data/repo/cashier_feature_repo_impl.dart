import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';
import 'package:test_pos_app/features/cashier_feature/data/sources/cashier_feature_data_source/cashier_feature_data_source.dart';
import 'package:test_pos_app/features/cashier_feature/domain/repo/cashier_feature_repo.dart';

class CashierFeatureRepoImpl implements CashierFeatureRepo {
  final CashierFeatureDataSource _cashierFeatureDataSource;

  CashierFeatureRepoImpl(this._cashierFeatureDataSource);

  @override
  Future<List<CustomerInvoice>> invoices() => _cashierFeatureDataSource.invoices();
}
