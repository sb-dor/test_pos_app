import 'package:test_pos_app/common/models/customer_invoice_detail_model.dart';
import 'package:test_pos_app/common/models/place_model.dart';
import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:test_pos_app/common/utils/database/database_helpers/customer_invoice_database_helper.dart';
import 'package:test_pos_app/features/order_feature/models/order_item_model.dart';

abstract class IOrderFeatureSource {
  Future<void> addToDb({required PlaceModel? place, required OrderItemModel? item});

  Future<bool> finishInvoice(PlaceModel? place, List<OrderItemModel> items);

  Future<List<OrderItemModel>> dbOrderItems(PlaceModel? place);

  Future<void> deleteOrderItemFromOrder(OrderItemModel? item, PlaceModel? place);
}

class OrderFeatureSourceImpl implements IOrderFeatureSource {
  OrderFeatureSourceImpl({required final AppDatabase appDatabase})
      : _customerInvoiceDatabaseHelper = CustomerInvoiceDatabaseHelper(
          appDatabase,
        );

  final CustomerInvoiceDatabaseHelper _customerInvoiceDatabaseHelper;

  @override
  Future<void> addToDb({required PlaceModel? place, required OrderItemModel? item}) async {
    final customerInvoiceModel = CustomerInvoiceDetailModel.fromOrderItem(item);
    await _customerInvoiceDatabaseHelper.addProduct(place, customerInvoiceModel);
  }

  @override
  Future<bool> finishInvoice(PlaceModel? place, List<OrderItemModel> items) =>
      _customerInvoiceDatabaseHelper.finishCustomerInvoice(place, items);

  @override
  Future<List<OrderItemModel>> dbOrderItems(PlaceModel? place) async {
    final customerInvoicesDetails =
        await _customerInvoiceDatabaseHelper.customerInvoiceDetails(place);
    return customerInvoicesDetails.map(OrderItemModel.fromCustomerInvoiceDetail).toList();
  }

  @override
  Future<void> deleteOrderItemFromOrder(OrderItemModel? item, PlaceModel? place) =>
      _customerInvoiceDatabaseHelper.deleteOrderItemFromOrder(
        item,
        place,
      );
}
