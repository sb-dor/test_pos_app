import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/pages/screens/sales_mode_screens/sales_mode_products_screen.dart';
import 'package:test_pos_app/features/order_feature/view/pages/screens/sales_mode_screens/sales_mode_settings_screen.dart';
import 'package:test_pos_app/injections/injections.dart';

@RoutePage()
class SalesModeScreen extends StatefulWidget {
  const SalesModeScreen({super.key});

  @override
  State<SalesModeScreen> createState() => _SalesModeScreenState();
}

class _SalesModeScreenState extends State<SalesModeScreen> {
  late List<Tab> _tabs;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _tabs = [
      Tab(text: "${Constants.products} (${GlobalData.products.length})"),
      const Tab(text: Constants.settings),
    ];
    _screens = [
      const SalesModeProductsScreen(),
      const SalesModeSettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screens.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.salesMode),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: _tabs,
            indicatorColor: Colors.blue,
          ),
        ),
        body: TabBarView(children: _screens),
      ),
    );
  }
}
