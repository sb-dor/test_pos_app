import 'package:test_pos_app/core/global_models/entities/customer_invoice_detail.dart';

class CustomerInvoiceDetailModel extends CustomerInvoiceDetail {
  const CustomerInvoiceDetailModel({
    super.id,
    super.customerInvoiceId,
    super.product,
    super.price,
    super.qty,
  });

  factory CustomerInvoiceDetailModel.fromDb(Map<String, dynamic> db) =>
      CustomerInvoiceDetailModel();
}
