import 'package:flutter/foundation.dart';
import 'state_model/cashier_feature_state_model.dart';

@immutable
sealed class CashierFeatureStates {
  final CashierFeatureStateModel cashierFeatureStateModel;

  const CashierFeatureStates(this.cashierFeatureStateModel);
}

@immutable
final class LoadingCashierFeatureState extends CashierFeatureStates {
  const LoadingCashierFeatureState(super.cashierFeatureStateModel);
}

@immutable
final class ErrorCashierFeatureState extends CashierFeatureStates {
  const ErrorCashierFeatureState(super.cashierFeatureStateModel);
}

@immutable
final class LoadedCashierFeatureState extends CashierFeatureStates {
  const LoadedCashierFeatureState(super.cashierFeatureStateModel);
}
