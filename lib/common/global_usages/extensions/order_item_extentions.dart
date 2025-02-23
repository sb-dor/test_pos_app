import 'package:test_pos_app/features/order_feature/models/order_item_model.dart';

extension OrderItemExtensions on List<OrderItemModel> {
  double total() {
    return fold(0.0, (prev, item) => prev += (item.total() ?? 0.0));
  }

  double totalQty() {
    return fold(0.0, (prev, item) => prev += (item.qty ?? 0.0));
  }
}
