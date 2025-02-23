import 'package:flutter/foundation.dart';

import 'state_model/order_feature_state_model.dart';

@immutable
class OrderFeatureStates {
  final OrderFeatureStateModel orderFeatureStateModel;

  const OrderFeatureStates(this.orderFeatureStateModel);
}

class InitialOrderFeatureState extends OrderFeatureStates {
  const InitialOrderFeatureState(super.orderFeatureStateModel);
}
