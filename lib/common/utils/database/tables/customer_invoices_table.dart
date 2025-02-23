import 'package:drift/drift.dart';

class CustomerInvoicesTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get waiterID => integer().named('waiter_id').nullable()();

  IntColumn get placeID => integer().named('place_id').nullable()();

  RealColumn get total => real().nullable()();

  RealColumn get totalQty => real().nullable()();

  TextColumn get status => text().nullable()();

  TextColumn get invoiceDatetime => text().nullable()();

  @override
  String? get tableName => "customer_invoices";
}
