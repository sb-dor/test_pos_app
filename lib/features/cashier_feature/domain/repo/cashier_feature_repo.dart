import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';

abstract class CashierFeatureRepo {
  Future<List<CustomerInvoice>> invoices();
}
