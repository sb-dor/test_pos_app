import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';

class CustomerInvoiceModel extends CustomerInvoice {
  const CustomerInvoiceModel({
    super.id,
    super.waiter,
    super.total,
    super.totalQty,
    super.details,
  });

  factory CustomerInvoiceModel.fromDb(Map<String, dynamic> db) => CustomerInvoiceModel();
}
