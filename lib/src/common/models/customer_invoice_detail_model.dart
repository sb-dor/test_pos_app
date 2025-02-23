import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:test_pos_app/src/common/global_data/global_data.dart';
import 'package:test_pos_app/src/common/models/product_model.dart';
import 'package:test_pos_app/src/common/utils/database/app_database.dart';
import 'package:test_pos_app/src/features/order_feature/models/order_item_model.dart';

@immutable
class CustomerInvoiceDetailModel {
  const CustomerInvoiceDetailModel({
    this.id,
    this.customerInvoiceId,
    this.product,
    this.price,
    this.qty,
    this.total,
  });

  final int? id;
  final int? customerInvoiceId;
  final ProductModel? product;
  final double? price;
  final double? qty;
  final double? total;

  factory CustomerInvoiceDetailModel.fromDb(Map<String, dynamic> db) => CustomerInvoiceDetailModel(
        id: db['id'],
        customerInvoiceId: db['customer_invoice_id'],
        product: GlobalData.products.firstWhereOrNull((e) => e.id == db['product_id']),
        price: db['price'],
        qty: db['qty'],
        total: db['total'],
      );

  factory CustomerInvoiceDetailModel.fromOrderItem(OrderItemModel? item) {
    return CustomerInvoiceDetailModel(
      product: item?.product,
      price: item?.price,
      qty: item?.qty,
    );
  }

  Map<String, dynamic> toDb(int? customerInvoiceId) => {
        "customer_invoice_id": customerInvoiceId,
        "product_id": product?.id,
        "price": price,
        "qty": qty,
        "total": (price ?? 0.0) * (qty ?? 0.0),
      };

  CustomerInvoiceDetailsTableCompanion toDbCompanion(int? customerInvoiceId) {
    return CustomerInvoiceDetailsTableCompanion(
      customerInvoiceId: Value(customerInvoiceId),
      productId: Value(product?.id),
      price: Value(price),
      qty: Value(qty),
      total: Value(total),
    );
  }
}
