import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_pos_app/common/app_routing/app_routing.dart';
import 'package:test_pos_app/common/models/place_model.dart';
import 'package:test_pos_app/features/order_feature/bloc/order_feature_bloc.dart';
import 'package:test_pos_app/features/order_feature/bloc/order_feature_events.dart';

class VipPlaceWidget extends StatelessWidget {
  final PlaceModel place;
  final OrderFeatureBloc orderFeatureBloc;

  const VipPlaceWidget({
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
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: place.color,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 30,
              child: Center(
                child: place.icon,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  "${place.name}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
