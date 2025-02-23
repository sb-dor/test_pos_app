import 'package:flutter/material.dart';
import 'package:test_pos_app/features/initialization/widgets/dependencies_scope.dart';
import 'package:test_pos_app/features/order_feature/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/bloc/order_feature_events.dart';
import 'package:test_pos_app/features/order_feature/bloc/order_feature_states.dart';

class OrderingProducts extends StatefulWidget {
  const OrderingProducts({super.key});

  @override
  State<OrderingProducts> createState() => _OrderingProductsState();
}

class _OrderingProductsState extends State<OrderingProducts> {
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
          case ConnectionState.waiting:
          case ConnectionState.none:
            return const CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            final currentStateModel = snap.requireData.orderFeatureStateModel;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                mainAxisExtent: 110,
                crossAxisSpacing: 10,
              ),
              itemCount: currentStateModel.productsForShow.length,
              itemBuilder: (context, index) {
                final product = currentStateModel.productsForShow[index];
                return GestureDetector(
                  onTap: () => _orderFeatureBloc.events.add(AddProductToOrderEvent(product)),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 70,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/image.webp',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${product.price}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const Text(
                                    "Склад 999",
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${product.name}",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
