import 'package:flutter/material.dart';
import 'package:test_pos_app/src/common/utils/constants/constants.dart';
import 'package:test_pos_app/src/common/utils/extensions/order_item_extentions.dart';
import 'package:test_pos_app/src/features/initialization/widgets/dependencies_scope.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_events.dart';
import 'package:test_pos_app/src/features/order_feature/bloc/order_feature_states.dart';
import 'package:test_pos_app/src/features/order_feature/widgets/widgets/order_categories.dart';
import 'package:test_pos_app/src/features/order_feature/widgets/widgets/ordered_details.dart';
import 'package:test_pos_app/src/features/order_feature/widgets/widgets/ordering_products.dart';

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
    _orderFeatureBloc = DependenciesScope.of(context, listen: false).orderFeatureBloc;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrderFeatureStates>(
      stream: _orderFeatureBloc.state,
      builder: (context, snap) {
        switch (snap.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            final currentStateModel = snap.requireData.orderFeatureStateModel;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  if (currentStateModel.orderItems.isNotEmpty)
                    GestureDetector(
                      onTap: () => _orderFeatureBloc.events.add(FinishCustomerInvoice()),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "${Constants.pay} - ${currentStateModel.orderItems.total()}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 5),
                  const OrderedDetails(),
                  Expanded(
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        OrderCategories(),
                        SizedBox(height: 20),
                        OrderingProducts(),
                      ],
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}
