import 'package:flutter/foundation.dart';
import 'package:test_pos_app/common/models/category_model.dart';
import 'package:test_pos_app/common/models/place_model.dart';
import 'package:test_pos_app/common/models/product_model.dart';
import 'package:test_pos_app/features/order_feature/models/order_item_model.dart';

@immutable
sealed class OrderFeatureEvents {}

final class AddPlaceEvent extends OrderFeatureEvents {
  final PlaceModel? place;

  AddPlaceEvent(this.place);
}

final class SelectCategoryEvent extends OrderFeatureEvents {
  final CategoryModel? category;

  SelectCategoryEvent(this.category);
}

final class AddProductToOrderEvent extends OrderFeatureEvents {
  final ProductModel? product;

  AddProductToOrderEvent(this.product);
}

final class DecrementOrderItemQtyEvent extends OrderFeatureEvents {
  final ProductModel? product;

  DecrementOrderItemQtyEvent(this.product);
}

final class AddOrderItemForChange extends OrderFeatureEvents {
  final OrderItemModel? orderItem;

  AddOrderItemForChange(this.orderItem);
}

class DeleteOrderItemFromOrder extends OrderFeatureEvents {}

class FinishCustomerInvoice extends OrderFeatureEvents {}
