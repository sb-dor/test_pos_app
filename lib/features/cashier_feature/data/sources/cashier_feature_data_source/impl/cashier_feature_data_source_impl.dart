import 'package:test_pos_app/core/global_models/models/customer_invoice_model/customer_invoice_model.dart';
import 'package:test_pos_app/core/local_database_service/local_database_service.dart';
import 'package:test_pos_app/features/cashier_feature/data/sources/cashier_feature_data_source/cashier_feature_data_source.dart';
import 'package:test_pos_app/injections/injections.dart';

class CashierFeatureDataSourceImpl implements CashierFeatureDataSource {
  final _localDatabase = locator<LocalDatabaseService>();

  @override
  Future<List<CustomerInvoiceModel>> invoices() => _localDatabase.customerInvoices();
}
