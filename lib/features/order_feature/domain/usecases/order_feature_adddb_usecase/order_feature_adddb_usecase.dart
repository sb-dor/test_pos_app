import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';
import 'package:test_pos_app/features/order_feature/domain/repo/order_feature_repo.dart';

class OrderFeatureAddDbUsecase {
  final OrderFeatureRepo _featureRepo;

  OrderFeatureAddDbUsecase(this._featureRepo);

  Future<void> addToDb({required Place? place, required OrderItem? item}) => _featureRepo.addToDb(
        place: place,
        item: item,
      );

  Future<bool> finishCustomerInvoice(Place? place, List<OrderItem> items) =>
      _featureRepo.finishInvoice(place, items);

  Future<List<OrderItem>> dbOrderItems(Place? place) => _featureRepo.dbOrderItems(place);

  Future<void> deleteOrderItemFromOrder(OrderItem? item, Place? place) =>
      _featureRepo.deleteOrderItemFromOrder(item, place);
}
