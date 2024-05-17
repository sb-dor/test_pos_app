import 'package:collection/collection.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_models/entities/customer_invoice_detail.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

class CustomerInvoiceDetailModel extends CustomerInvoiceDetail {
  const CustomerInvoiceDetailModel({
    super.id,
    super.customerInvoiceId,
    super.product,
    super.price,
    super.qty,
    super.total,
  });

  factory CustomerInvoiceDetailModel.fromDb(Map<String, dynamic> db) => CustomerInvoiceDetailModel(
        id: db['id'],
        customerInvoiceId: db['customer_invoice_id'],
        product: GlobalData.products.firstWhereOrNull((e) => e.id == db['product_id']),
        price: db['price'],
        qty: db['qty'],
        total: db['total'],
      );

  factory CustomerInvoiceDetailModel.fromOrderItem(OrderItem? item) {
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
        "total": (price ?? 0.0) * (qty ?? 0.0)
      };
}
