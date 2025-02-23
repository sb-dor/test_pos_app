import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/src/common/utils/database/app_database.dart';
import 'package:test_pos_app/src/common/utils/reusable_functions.dart';
import 'package:test_pos_app/src/features/initialization/logic/composition_root/composition_root.dart';
import 'package:test_pos_app/src/features/initialization/widgets/material_context.dart';
import 'package:window_manager/window_manager.dart';

final class AppRunner {
  //
  Future<void> initialize() async {
    //
    await runZonedGuarded(
      () async {
        final binding = WidgetsFlutterBinding.ensureInitialized();

        binding.deferFirstFrame();

        if (ReusableFunctions.instance.isDesktop) {
          await windowManager.ensureInitialized();
          final WindowOptions windowOptions = WindowOptions(
            size: Size(800, 600),
            minimumSize: Size(800, 600),
            maximumSize: Size.infinite,
            center: true,
            backgroundColor: Colors.transparent,
            // skipTaskbar: false,
            // titleBarStyle: TitleBarStyle.hidden,
          );
          windowManager.waitUntilReadyToShow(windowOptions, () async {
            await windowManager.show();
            await windowManager.focus();
          });
        }

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
