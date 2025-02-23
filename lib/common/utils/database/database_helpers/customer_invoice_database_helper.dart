import 'package:test_pos_app/common/global_data/global_data.dart';
import 'package:test_pos_app/common/global_usages/constants/constants.dart';
import 'package:test_pos_app/common/global_usages/extensions/order_item_extentions.dart';
import 'package:test_pos_app/common/models/customer_invoice_detail_model.dart';
import 'package:test_pos_app/common/models/customer_invoice_model.dart';
import 'package:test_pos_app/common/models/place_model.dart';
import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:drift/drift.dart'; // import for "&" or "|"
import 'package:test_pos_app/features/order_feature/data/models/order_item_model.dart';

// in order to use "&" or "|" expression import drift.dart package
final class CustomerInvoiceDatabaseHelper {
  CustomerInvoiceDatabaseHelper(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<void> addProduct(PlaceModel? place, CustomerInvoiceDetailModel? item) async {
    final checkInvoiceForPlace = await (_appDatabase.select(_appDatabase.customerInvoicesTable)
          ..where(
            (element) =>
                element.placeID.equals(place?.id ?? 0) &
                element.status.equals(
                  Constants.PENDING,
                ),
          ))
        .get();

    int? customerInvoiceId;

    if (checkInvoiceForPlace.isEmpty) {
      customerInvoiceId = await _appDatabase.into(_appDatabase.customerInvoicesTable).insert(
            CustomerInvoicesTableCompanion(
              waiterID: Value(GlobalData.currentWaiter.id),
              placeID: Value(place?.id),
              status: Value(Constants.PENDING),
            ),
          );
    } else {
      customerInvoiceId = int.tryParse("${checkInvoiceForPlace.first.id}");
    }
    await _update(customerInvoiceId, item);
  }

  Future<void> _update(int? customerInvoiceId, CustomerInvoiceDetailModel? item) async {
    final checkItemsWithCurrentInvoice =
        await (_appDatabase.select(_appDatabase.customerInvoiceDetailsTable)
              ..where(
                (element) {
                  return element.customerInvoiceId.equals(customerInvoiceId ?? 0) &
                      element.productId.equals(
                        item?.product?.id ?? 0,
                      );
                },
              ))
            .get();

    if (checkItemsWithCurrentInvoice.isEmpty) {
      if (item != null) {
        await _appDatabase.into(_appDatabase.customerInvoiceDetailsTable).insert(
              item.toDbCompanion(customerInvoiceId),
            );
      }
    } else {
      if (item != null) {
        if ((item.qty ?? 0.0) <= 0.0) {
          await (_appDatabase.delete(_appDatabase.customerInvoiceDetailsTable)
                ..where((element) {
                  return element.customerInvoiceId.equals(customerInvoiceId ?? 0) &
                      element.productId.equals(item.product?.id ?? 0);
                }))
              .go();

          // check if invoice doesn't have any data delete invoice
          checkInvoiceForEmptyDetails(customerInvoiceId ?? 0);
          return;
        }

        await (_appDatabase.update(_appDatabase.customerInvoiceDetailsTable)
              ..where(
                (element) {
                  return element.customerInvoiceId.equals(customerInvoiceId ?? 0) &
                      element.productId.equals(item.product?.id ?? 0);
                },
              ))
            .write(item.toDbCompanion(customerInvoiceId));
      }
    }
  }

  Future<void> deleteOrderItemFromOrder(OrderItemModel? orderItem, PlaceModel? place) async {
    final checkInvoiceForPlace = await (_appDatabase.select(_appDatabase.customerInvoicesTable)
          ..where(
            (element) {
              return element.placeID.equals(place?.id ?? 0) &
                  element.status.equals(Constants.PENDING);
            },
          ))
        .get();

    if (checkInvoiceForPlace.isNotEmpty) {
      await (_appDatabase.delete(_appDatabase.customerInvoiceDetailsTable)
            ..where(
              (element) {
                return element.customerInvoiceId.equals(checkInvoiceForPlace.first.id) &
                    element.productId.equals(orderItem?.product?.id ?? 0);
              },
            ))
          .go();

      checkInvoiceForEmptyDetails(int.parse("${checkInvoiceForPlace.first.id}"));
    }
  }

  // if invoice doesn't have any table remove whole invoice
  Future<void> checkInvoiceForEmptyDetails(int invoiceId) async {
    final checkInvoiceForPlace =
        await (_appDatabase.select(_appDatabase.customerInvoiceDetailsTable)
              ..where(
                (element) {
                  return element.customerInvoiceId.equals(invoiceId);
                },
              ))
            .get();

    if (checkInvoiceForPlace.isEmpty) {
      await (_appDatabase.delete(_appDatabase.customerInvoicesTable)
            ..where(
              (element) {
                return element.id.equals(invoiceId);
              },
            ))
          .go();
    }
  }

  Future<bool> finishCustomerInvoice(PlaceModel? place, List<OrderItemModel> items) async {
    final currentDateTime = DateTime.now().toString().substring(0, 19);
    await (_appDatabase.update(_appDatabase.customerInvoicesTable)
          ..where(
            (element) {
              return element.placeID.equals(place?.id ?? 0) &
                  element.status.equals(Constants.PENDING);
            },
          ))
        .write(
      CustomerInvoicesTableCompanion(
        status: Value(null),
        total: Value(items.total()),
        totalQty: Value(items.totalQty()),
        invoiceDatetime: Value(currentDateTime),
      ),
    );

    return true;
  }

  Future<List<CustomerInvoiceDetailModel>> customerInvoiceDetails(PlaceModel? place) async {
    final invoice = await (_appDatabase.select(_appDatabase.customerInvoicesTable)
          ..where(
            (element) {
              return element.placeID.equals(place?.id ?? 0) & element.status.isNotNull();
            },
          ))
        .get();

    if (invoice.isEmpty) return <CustomerInvoiceDetailModel>[];

    final customerInvoiceDetails =
        await (_appDatabase.select(_appDatabase.customerInvoiceDetailsTable)
              ..where(
                (element) {
                  return element.customerInvoiceId.equals(invoice.first.id);
                },
              ))
            .get();

    return customerInvoiceDetails
        .map((e) => CustomerInvoiceDetailModel.fromDb(e.toJson()))
        .toList();
  }

  Future<List<CustomerInvoiceModel>> customerInvoices() async {
    final details = (await (_appDatabase.select(_appDatabase.customerInvoiceDetailsTable)).get())
        .map((element) => CustomerInvoiceDetailModel.fromDb(element.toJson()));

    final customerInvoices = (await (_appDatabase.select(_appDatabase.customerInvoicesTable)
          ..where(
            (element) {
              return element.status.isNull();
            },
          )
          ..orderBy(
            [
              (element) => OrderingTerm.desc(element.invoiceDatetime),
            ],
          ))
        .get());

    return customerInvoices
        .map(
          (invoice) => CustomerInvoiceModel.fromDb(
            invoice.toJson(),
            details.where((e) => e.customerInvoiceId == invoice.id).toList(),
          ),
        )
        .toList();
  }
}
