import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/features/order_feature/data/models/order_item_model.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

abstract class OrderFeatureSource {
  Future<void> addToDb({required Place? place, required OrderItem? item});

  Future<bool> finishInvoice(Place? place);

  Future<List<OrderItemModel>> dbOrderItems(Place? place);
}
