import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:test_pos_app/src/common/global_data/global_data.dart';
import 'package:test_pos_app/src/common/models/customer_invoice_detail_model.dart';
import 'package:test_pos_app/src/common/models/place_model.dart';
import 'package:test_pos_app/src/common/models/waiter_model.dart';

@immutable
class CustomerInvoiceModel {
  const CustomerInvoiceModel({
    this.id,
    this.waiter,
    this.place,
    this.total,
    this.totalQty,
    this.status,
    this.details,
    this.invoiceDateTime,
  });

  final int? id;
  final WaiterModel? waiter;
  final PlaceModel? place;
  final double? total;
  final double? totalQty;
  final String? status;
  final List<CustomerInvoiceDetailModel>? details;
  final String? invoiceDateTime;

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
