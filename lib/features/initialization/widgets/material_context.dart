import 'package:flutter/material.dart';
import 'package:test_pos_app/common/app_routing/app_routing.dart';
import 'package:test_pos_app/features/initialization/models/dependency_container.dart';
import 'package:test_pos_app/features/initialization/widgets/dependencies_scope.dart';

class MaterialContext extends StatefulWidget {
  const MaterialContext({
    super.key,
    required this.dependencyContainer,
  });

  final DependencyContainer dependencyContainer;

  @override
  State<MaterialContext> createState() => _MaterialContextState();
}

class _MaterialContextState extends State<MaterialContext> {
  final _autoRoting = AppRouter();

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
