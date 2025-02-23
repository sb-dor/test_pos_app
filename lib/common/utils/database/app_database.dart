import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

@DriftDatabase()
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
