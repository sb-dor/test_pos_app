import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/app_routing/app_routing.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';

class MainAppDrawer extends StatelessWidget {
  const MainAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amberAccent.shade100,
              ),
              child: Text("${GlobalData.currentWaiter.name}"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.cabin_sharp),
            title: const Text(Constants.cashier),
            onTap: () {
              Navigator.pop(context);
              AutoRouter.of(context).replaceAll([const OrderFeatureRoute()]);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cabin_sharp),
            title: const Text(Constants.salesMode),
            onTap: () {
              Navigator.pop(context);
              AutoRouter.of(context).replaceAll([const OrderFeatureRoute()]);
            },
          ),
        ],
      ),
    );
  }
}
