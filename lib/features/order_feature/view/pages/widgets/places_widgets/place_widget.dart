import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/core/app_routing/app_routing.dart';
import 'package:test_pos_app/core/global_models/entities/place.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_events.dart';

class PlaceWidget extends StatelessWidget {
  final Place place;
  final OrderFeatureBloc orderFeatureBloc;

  const PlaceWidget({
    super.key,
    required this.place,
    required this.orderFeatureBloc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        orderFeatureBloc.events.add(AddPlaceEvent(place));
        AutoRouter.of(context).push(const SalesModeRoute());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amberAccent.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "${place.name}",
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
