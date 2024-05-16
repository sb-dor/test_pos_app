import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/product.dart';

@immutable
class CustomerInvoiceDetail {
  final int? id;
  final int? customerInvoiceId;
  final Product? product;
  final double? price;
  final double? qty;

  const CustomerInvoiceDetail({
    required this.id,
    required this.customerInvoiceId,
    required this.product,
    required this.price,
    required this.qty,
  });
}
