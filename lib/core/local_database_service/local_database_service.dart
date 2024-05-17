import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_models/entities/customer_invoice_detail.dart';
import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/core/global_models/models/customer_invoice_detail_model/customer_invoice_detail_model.dart';
import 'package:test_pos_app/features/order_feature/data/models/order_item_model.dart';
import 'package:test_pos_app/features/order_feature/domain/entities/order_item.dart';

class LocalDatabaseService {
  late final Database database;

  static const String customerInvoiceTable = 'customer_invoices';
  static const String customerInvoicesDetailsTable = 'customer_invoices_details';

  Future<void> initDatabase() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'test_pos_app.db');

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await _createTables(db);
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        return await _createTables(db);
      },
    );
  }

  Future<void> _createTables(Database db) async {
    await db.execute(
      "CREATE TABLE IF NOT EXISTS $customerInvoiceTable (id INTEGER PRIMARY KEY AUTOINCREMENT, waiter_id INTEGER,"
      " place_id INTEGER, total REAL, total_qty REAL, status TEXT)",
    );

    await db.execute(
      "CREATE TABLE IF NOT EXISTS $customerInvoicesDetailsTable (id INTEGER PRIMARY KEY AUTOINCREMENT, customer_invoice_id INTEGER,"
      " product_id INTEGER, price REAL, qty REAL, total REAL)",
    );
  }

  Future<void> addProduct(Place? place, CustomerInvoiceDetailModel? item) async {
    final checkInvoiceForPlace = await database.query(
      customerInvoiceTable,
      where: "place_id = ? and status = ?",
      whereArgs: [place?.id, "PENDING"],
    );

    int? customerInvoiceId;

    if (checkInvoiceForPlace.isEmpty) {
      customerInvoiceId = await database.insert(
        customerInvoiceTable,
        {
          "waiter_id": GlobalData.currentWaiter.id,
          "place_id": place?.id,
          "status": "PENDING",
        },
      );
    } else {
      customerInvoiceId = int.tryParse("${checkInvoiceForPlace.first['id']}");
    }
    await _update(customerInvoiceId, item);
  }

  Future<void> _update(int? customerInvoiceId, CustomerInvoiceDetailModel? item) async {
    final checkItemsWithCurrentInvoice = await database.query(
      customerInvoicesDetailsTable,
      where: "customer_invoice_id = ? and product_id = ?",
      whereArgs: [customerInvoiceId, item?.product?.id],
    );

    if (checkItemsWithCurrentInvoice.isEmpty) {
      await database.insert(
        customerInvoicesDetailsTable,
        item?.toDb(customerInvoiceId) ?? {},
      );
    } else {
      if ((item?.qty ?? 0.0) <= 0.0) {
        await database.delete(
          customerInvoicesDetailsTable,
          where: "customer_invoice_id = ? and product_id = ?",
          whereArgs: [customerInvoiceId, item?.product?.id],
        );
        return;
      }
      await database.update(
        customerInvoicesDetailsTable,
        item?.toDb(customerInvoiceId) ?? {},
        where: "customer_invoice_id = ? and product_id = ?",
        whereArgs: [customerInvoiceId, item?.product?.id],
      );
    }
  }

  Future<bool> finishCustomerInvoice(Place? place) async {
    await database.update(
      customerInvoiceTable,
      {"status": null},
      where: "place_id = ?",
      whereArgs: [place?.id],
    );

    return true;
  }

  Future<List<CustomerInvoiceDetail>> customerInvoiceDetails(Place? place) async {
    final invoice = await database.query(
      customerInvoiceTable,
      where: "place_id = ? and status is not null",
      whereArgs: [place?.id],
    );

    if (invoice.isEmpty) return <CustomerInvoiceDetail>[];

    final customerInvoiceDetails = await database.query(
      customerInvoicesDetailsTable,
      where: "customer_invoice_id = ?",
      whereArgs: [invoice.first['id']],
    );

    return customerInvoiceDetails.map((e) => CustomerInvoiceDetailModel.fromDb(e)).toList();
  }
}
