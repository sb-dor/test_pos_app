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

  double total() {
    return (price ?? 0.0) * (qty ?? 0.0);
  }
}
