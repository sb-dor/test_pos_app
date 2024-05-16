import 'package:flutter/material.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_states.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/order_categories/order_categories.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/ordered_details/ordered_details.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/ordering_products/ordering_products.dart';
import 'package:test_pos_app/injections/injections.dart';

class SalesModeProductsScreen extends StatefulWidget {
  const SalesModeProductsScreen({super.key});

  @override
  State<SalesModeProductsScreen> createState() => _SalesModeProductsScreenState();
}

class _SalesModeProductsScreenState extends State<SalesModeProductsScreen> {
  late OrderFeatureBloc _orderFeatureBloc;

  @override
  void initState() {
    super.initState();
    _orderFeatureBloc = locator<OrderFeatureBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderFeatureStates>(
      stream: _orderFeatureBloc.state,
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            final state = snap.requireData;
            final stateModel = state.orderFeatureStateModel;
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              children: [
                if (stateModel.orderItems.isNotEmpty) const OrderedDetails(),
                const OrderCategories(),
                const OrderingProducts(),
              ],
            );
        }
      },
    );
  }
}
