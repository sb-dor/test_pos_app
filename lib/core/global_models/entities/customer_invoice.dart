import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/waiter.dart';

// customer invoice with will have "waiter" order data

@immutable
class CustomerInvoice {
  final Waiter? waiter;
// final

  const CustomerInvoice({required this.waiter});
}
