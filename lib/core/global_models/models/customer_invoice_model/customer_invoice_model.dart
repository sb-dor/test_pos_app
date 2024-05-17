import 'package:collection/collection.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';
import 'package:test_pos_app/core/global_models/models/customer_invoice_detail_model/customer_invoice_detail_model.dart';

class CustomerInvoiceModel extends CustomerInvoice {
  const CustomerInvoiceModel({
    super.id,
    super.waiter,
    super.place,
    super.total,
    super.totalQty,
    super.status,
    super.details,
    super.invoiceDateTime,
  });

  factory CustomerInvoiceModel.fromDb(
    Map<String, dynamic> db,
    List<CustomerInvoiceDetailModel> details,
  ) =>
      CustomerInvoiceModel(
        id: db['id'],
        waiter: GlobalData.currentWaiter,
        place: GlobalData.places.firstWhereOrNull((e) => e.id == db['place_id']),
        total: double.tryParse("${db['total']}"),
        totalQty: double.tryParse("${db['total_qty']}"),
        status: db['status'],
        details: details,
        invoiceDateTime: db['invoice_datetime'],
      );
}
