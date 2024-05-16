import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/customer_invoice_detail.dart';
import 'package:test_pos_app/core/global_models/entities/waiter.dart';

// customer invoice with will have "waiter" order data

@immutable
class CustomerInvoice {
  final int? id;
  final Waiter? waiter;
  final double? total;
  final double? totalQty;
  final List<CustomerInvoiceDetail>? details;

  const CustomerInvoice({
    required this.id,
    required this.waiter,
    required this.total,
    required this.totalQty,
    required this.details,
  });
}
