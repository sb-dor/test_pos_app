import 'package:flutter/material.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_states.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/order_categories/order_categories.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/ordered_details/ordered_details.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/ordering_products/ordering_products.dart';
import 'package:test_pos_app/injections/injections.dart';

class SalesModeProductsScreen extends StatelessWidget {
  const SalesModeProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      children: const [
        OrderedDetails(),
        OrderCategories(),
        SizedBox(height: 20),
        OrderingProducts(),
      ],
    );
  }
}
