import 'package:flutter/material.dart';
import 'package:test_pos_app/injections/injections.dart';

import 'common/app_routing/app_routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Injections.injector();

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _autoRoting = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _autoRoting.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
