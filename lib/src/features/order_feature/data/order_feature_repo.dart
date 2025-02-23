import 'package:test_pos_app/src/common/models/place_model.dart';
import 'package:test_pos_app/src/features/order_feature/models/order_item_model.dart';

import 'order_feature_source.dart';

abstract class IOrderFeatureRepo {
  Future<void> addToDb({required PlaceModel? place, required OrderItemModel? item});

  Future<bool> finishInvoice(PlaceModel? place, List<OrderItemModel> items);

  Future<List<OrderItemModel>> dbOrderItems(PlaceModel? place);

  Future<void> deleteOrderItemFromOrder(OrderItemModel? item, PlaceModel? place);
}

class OrderFeatureRepoImpl implements IOrderFeatureRepo {
  final IOrderFeatureSource _featureSource;

  OrderFeatureRepoImpl(this._featureSource);

  @override
  Future<void> addToDb({required PlaceModel? place, required OrderItemModel? item}) =>
      _featureSource.addToDb(
        place: place,
        item: item,
      );

  @override
  Future<bool> finishInvoice(PlaceModel? place, List<OrderItemModel> items) =>
      _featureSource.finishInvoice(place, items);

  @override
  Future<List<OrderItemModel>> dbOrderItems(PlaceModel? place) =>
      _featureSource.dbOrderItems(place);

  @override
  Future<void> deleteOrderItemFromOrder(OrderItemModel? item, PlaceModel? place) =>
      _featureSource.deleteOrderItemFromOrder(item, place);
}
