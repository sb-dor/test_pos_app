import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/global_data/global_data.dart';
import 'package:test_pos_app/core/global_usages/constants/constants.dart';
import 'package:test_pos_app/core/global_usages/widges/main_app_drawer.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/pages/widgets/places_widgets/vip_place_widget.dart';
import 'package:test_pos_app/injections/injections.dart';

import 'widgets/places_widgets/place_widget.dart';

@RoutePage()
class OrderFeaturePage extends StatefulWidget {
  const OrderFeaturePage({super.key});

  @override
  State<OrderFeaturePage> createState() => _OrderFeaturePageState();
}

class _OrderFeaturePageState extends State<OrderFeaturePage> {
  late OrderFeatureBloc _orderFeatureBloc;

  @override
  void initState() {
    super.initState();
    _orderFeatureBloc = locator<OrderFeatureBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.chooseTextAppBar),
      ),
      drawer: const MainAppDrawer(),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 100,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: GlobalData.places.length,
            itemBuilder: (context, index) {
              final place = GlobalData.places[index];
              if ((place.vip ?? false)) {
                return VipPlaceWidget(
                  place: place,
                  orderFeatureBloc: _orderFeatureBloc,
                );
              } else {
                return PlaceWidget(
                  place: place,
                  orderFeatureBloc: _orderFeatureBloc,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
