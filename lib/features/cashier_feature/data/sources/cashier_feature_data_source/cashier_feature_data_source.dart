import 'package:test_pos_app/core/global_models/models/customer_invoice_model/customer_invoice_model.dart';

abstract class CashierFeatureDataSource {
  Future<List<CustomerInvoiceModel>> invoices();
}
