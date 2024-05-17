import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/features/order_feature/data/sources/order_feature_source/order_feature_source.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';
import 'package:test_pos_app/features/order_feature/domain/repo/order_feature_repo.dart';

class OrderFeatureRepoImpl implements OrderFeatureRepo {
  final OrderFeatureSource _featureSource;

  OrderFeatureRepoImpl(this._featureSource);

  @override
  Future<void> addToDb({required Place? place, required OrderItem? item}) => _featureSource.addToDb(
        place: place,
        item: item,
      );

  @override
  Future<bool> finishInvoice(Place? place, List<OrderItem> items) =>
      _featureSource.finishInvoice(place, items);

  @override
  Future<List<OrderItem>> dbOrderItems(Place? place) => _featureSource.dbOrderItems(place);

  @override
  Future<void> deleteOrderItemFromOrder(OrderItem? item, Place? place) =>
      _featureSource.deleteOrderItemFromOrder(item, place);
}
