import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/core/global_models/models/customer_invoice_detail_model/customer_invoice_detail_model.dart';
import 'package:test_pos_app/core/local_database_service/local_database_service.dart';
import 'package:test_pos_app/features/order_feature/data/models/order_item_model.dart';
import 'package:test_pos_app/features/order_feature/data/sources/order_feature_source/order_feature_source.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';
import 'package:test_pos_app/injections/injections.dart';

class OrderFeatureSourceImpl implements OrderFeatureSource {
  final _localDb = locator<LocalDatabaseService>();

  @override
  Future<void> addToDb({required Place? place, required OrderItem? item}) async {
    final customerInvoiceModel = CustomerInvoiceDetailModel.fromOrderItem(item);
    await _localDb.addProduct(place, customerInvoiceModel);
  }

  @override
  Future<bool> finishInvoice(Place? place, List<OrderItem> items) =>
      _localDb.finishCustomerInvoice(place, items);

  @override
  Future<List<OrderItemModel>> dbOrderItems(Place? place) async {
    final customerInvoicesDetails = await _localDb.customerInvoiceDetails(place);
    return customerInvoicesDetails.map((e) => OrderItemModel.fromCustomerInvoiceDetail(e)).toList();
  }

  @override
  Future<void> deleteOrderItemFromOrder(OrderItem? item, Place? place) =>
      _localDb.deleteOrderItemFromOrder(
        item,
        place,
      );
}
