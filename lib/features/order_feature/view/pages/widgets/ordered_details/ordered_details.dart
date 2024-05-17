import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_events.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_states.dart';
import 'package:test_pos_app/injections/injections.dart';

class OrderedDetails extends StatefulWidget {
  const OrderedDetails({super.key});

  @override
  State<OrderedDetails> createState() => _OrderedDetailsState();
}

class _OrderedDetailsState extends State<OrderedDetails> {
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
            final currentStateModel = snap.requireData.orderFeatureStateModel;
            return Column(
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
                      child: const Center(
                        child: Text(
                          Constants.pay,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: currentStateModel.orderItems.length,
                  itemBuilder: (context, index) {
                    final orderItem = currentStateModel.orderItems[index];
                    debugPrint("orderitem: $orderItem");
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            orderItem.product?.name ?? '-',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () => _orderFeatureBloc.events.add(
                            AddProductToOrderEvent(orderItem.product),
                          ),
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "${orderItem.qty?.toInt()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _orderFeatureBloc.events.add(
                            DecrementOrderItemQtyEvent(orderItem.product),
                          ),
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
        }
      },
    );
  }
}
