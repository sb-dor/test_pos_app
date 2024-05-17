import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/customer_invoice.dart';

import 'state_model/cashier_feature_state_model.dart';

@immutable
class CashierFeatureStates {
  final CashierFeatureStateModel cashierFeatureStateModel;

  const CashierFeatureStates(this.cashierFeatureStateModel);
}

@immutable
class LoadingCashierFeatureState extends CashierFeatureStates {
  const LoadingCashierFeatureState(super.cashierFeatureStateModel);
}

@immutable
class ErrorCashierFeatureState extends CashierFeatureStates {
  const ErrorCashierFeatureState(super.cashierFeatureStateModel);
}

@immutable
class LoadedCashierFeatureState extends CashierFeatureStates {
  const LoadedCashierFeatureState(super.cashierFeatureStateModel);
}
