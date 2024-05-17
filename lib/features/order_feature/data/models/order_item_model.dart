import 'package:test_pos_app/core/global_models/entities/customer_invoice_detail.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

class OrderItemModel extends OrderItem {
  OrderItemModel({
    super.product,
    super.price,
    super.qty,
  });

  static OrderItemModel? fromEntity(OrderItem? orderItem) {
    if (orderItem == null) return null;
    return OrderItemModel(
      product: orderItem.product,
      price: orderItem.price,
      qty: orderItem.qty,
    );
  }

  factory OrderItemModel.fromCustomerInvoiceDetail(CustomerInvoiceDetail? detail) {
    return OrderItemModel(
      product: detail?.product,
      price: detail?.price,
      qty: detail?.qty,
    );
  }

  Map<String, dynamic> toDb(int customerInvoiceId) {
    return {};
  }

  double total() {
    return (price ?? 0.0) * (qty ?? 0.0);
  }
}
