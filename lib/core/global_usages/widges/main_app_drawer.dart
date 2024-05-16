import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';

class MainAppDrawer extends StatelessWidget {
  const MainAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
    );
  }
}
