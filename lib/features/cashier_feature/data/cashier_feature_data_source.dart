import 'package:test_pos_app/common/models/customer_invoice_model.dart';
import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:test_pos_app/common/utils/database/database_helpers/customer_invoice_database_helper.dart';

abstract class ICashierFeatureDataSource {
  Future<List<CustomerInvoiceModel>> invoices();
}

class CashierFeatureDataSourceImpl implements ICashierFeatureDataSource {
  CashierFeatureDataSourceImpl({
    required final AppDatabase appDatabase,
  }) : _customerInvoiceDatabaseHelper = CustomerInvoiceDatabaseHelper(appDatabase);

  final CustomerInvoiceDatabaseHelper _customerInvoiceDatabaseHelper;

  @override
  Future<List<CustomerInvoiceModel>> invoices() =>
      _customerInvoiceDatabaseHelper.customerInvoices();
}
