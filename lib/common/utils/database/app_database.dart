import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/customer_invoice_details_table.dart';
import 'tables/customer_invoices_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CustomerInvoicesTable,
    CustomerInvoiceDetailsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.defaults({required String name})
      : super(
          driftDatabase(
            name: name,
            native: const DriftNativeOptions(shareAcrossIsolates: true),
            web: DriftWebOptions(
              sqlite3Wasm: Uri.parse('sqlite3.wasm'),
              driftWorker: Uri.parse('drift_worker.js'),
            ),
          ),
        );

  @override
  int get schemaVersion => 1;
}
