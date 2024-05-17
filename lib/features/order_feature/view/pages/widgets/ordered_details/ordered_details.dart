import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';
import 'package:test_pos_app/core/global_usages/extensions/order_item_extentions.dart';
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
            return Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 15),
                shrinkWrap: true,
                itemCount: currentStateModel.orderItems.length,
                itemBuilder: (context, index) {
                  final orderItem = currentStateModel.orderItems[index];
                  return GestureDetector(
                    onTap: () => _orderFeatureBloc.events.add(AddOrderItemForChange(orderItem)),
                    child: Container(
                      color:
                          currentStateModel.orderItemForChange?.product?.id == orderItem.product?.id
                              ? Colors.blueAccent.shade100
                              : Colors.transparent,
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
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
                          ),
                          if (currentStateModel.orderItemForChange?.product?.id ==
                              orderItem.product?.id)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                      backgroundColor: WidgetStatePropertyAll(Colors.red.shade500),
                                    ),
                                    onPressed: () =>
                                        _orderFeatureBloc.events.add(DeleteOrderItemFromOrder()),
                                    child: const Text(
                                      "Удалить из счета",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
