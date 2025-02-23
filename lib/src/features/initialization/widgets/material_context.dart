import 'package:flutter/material.dart';
import 'package:test_pos_app/src/common/app_routing/app_routing.dart';
import 'package:test_pos_app/src/features/initialization/logic/app_runner.dart';
import 'package:test_pos_app/src/features/initialization/models/dependency_container.dart';
import 'package:test_pos_app/src/features/initialization/widgets/dependencies_scope.dart';
import 'package:window_manager/window_manager.dart';

class MaterialContext extends StatefulWidget {
  const MaterialContext({
    super.key,
    required this.dependencyContainer,
  });

  final DependencyContainer dependencyContainer;

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> with WindowListener {
  final _autoRoting = AppRouter();

  @override
  void initState() {
    super.initState();
    windowManager.addListener(this);
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    super.dispose();
  }

  @override
  void onWindowResize() async {
    final getSize = await windowManager.getSize();
    final minSize = desktopMinSize;
    if (getSize.width < minSize.width || getSize.height < minSize.height) {
      windowManager.setMinimumSize(desktopMinSize);
    }
    super.onWindowResize();
  }

  @override
  Widget build(BuildContext context) {
    return DependenciesScope(
      dependencies: widget.dependencyContainer,
      child: MaterialApp.router(
        routerConfig: _autoRoting.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
