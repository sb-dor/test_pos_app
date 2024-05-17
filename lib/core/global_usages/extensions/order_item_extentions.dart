import 'package:test_pos_app/features/order_feature/data/models/order_item_model.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

extension OrderItemExtensions on List<OrderItem> {
  double total() {
    return fold(0.0, (prev, item) => prev += (OrderItemModel.fromEntity(item)?.total() ?? 0.0));
  }

  double totalQty(){
    return fold(0.0, (prev, item) => prev += (item.qty ?? 0.0));
  }
}
