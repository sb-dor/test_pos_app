import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_pos_app/common/utils/database/app_database.dart';
import 'package:test_pos_app/features/initialization/logic/composition_root/composition_root.dart';
import 'package:test_pos_app/features/initialization/widgets/material_context.dart';

final class AppRunner {
  //
  Future<void> initialize() async {
    //
    await runZonedGuarded(
      () async {
        final binding = WidgetsFlutterBinding.ensureInitialized();

        binding.deferFirstFrame();

        try {
          final appDatabase = AppDatabase.defaults(name: 'test_pos_app');

          final compositionResult = await CompositionRoot(
            appDatabase: appDatabase,
          ).create();

          runApp(
            MaterialContext(
              dependencyContainer: compositionResult.dependencyContainer,
            ),
          );
        } catch (error, stackTrace) {
          rethrow;
        } finally {
          binding.allowFirstFrame();
        }
      },
      (error, stackTrace) {},
    );
  }
}
