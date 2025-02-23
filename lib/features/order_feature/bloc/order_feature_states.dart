import 'package:flutter/foundation.dart';

import 'state_model/order_feature_state_model.dart';

@immutable
sealed class OrderFeatureStates {
  final OrderFeatureStateModel orderFeatureStateModel;

  const OrderFeatureStates(this.orderFeatureStateModel);
}

final class InitialOrderFeatureState extends OrderFeatureStates {
  const InitialOrderFeatureState(super.orderFeatureStateModel);
}
