import 'package:test_pos_app/core/global_models/entities/category.dart' as cat;
import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/product.dart';

@immutable
class OrderFeatureEvents {}

class AddPlaceEvent extends OrderFeatureEvents {
  final Place? place;

  AddPlaceEvent(this.place);
}

class SelectCategoryEvent extends OrderFeatureEvents {
  final cat.Category? category;

  SelectCategoryEvent(this.category);
}

class AddProductToOrderEvent extends OrderFeatureEvents {
  final Product? product;

  AddProductToOrderEvent(this.product);
}

class DecrementOrderItemQtyEvent extends OrderFeatureEvents {
  final Product? product;

  DecrementOrderItemQtyEvent(this.product);
}

class FinishCustomerInvoice extends OrderFeatureEvents {}
