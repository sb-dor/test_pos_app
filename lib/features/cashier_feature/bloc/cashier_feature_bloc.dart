import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_pos_app/features/cashier_feature/data/cashier_feature_repo.dart';
import 'cashier_feature_events.dart';
import 'cashier_feature_states.dart';
import 'state_model/cashier_feature_state_model.dart';

@immutable
class CashierFeatureBloc {
  static late BehaviorSubject<CashierFeatureStates> _currentState;
  static late CashierFeatureStateModel _currentStateModel;
  static late ICashierFeatureRepo _iCashierFeatureRepo;

  final Sink<CashierFeatureEvents> events;
  final BehaviorSubject<CashierFeatureStates> _states;

  BehaviorSubject<CashierFeatureStates> get state => _states;

  const CashierFeatureBloc._({
    required this.events,
    required BehaviorSubject<CashierFeatureStates> states,
  }) : _states = states;

  factory CashierFeatureBloc({
    required ICashierFeatureRepo cashierFeatureRepo,
  }) {
    _currentStateModel = CashierFeatureStateModel();
    _iCashierFeatureRepo = cashierFeatureRepo;

    final eventsBehavior = BehaviorSubject<CashierFeatureEvents>();

    final states = eventsBehavior.switchMap<CashierFeatureStates>((events) async* {
      yield* _eventHandler(events);
    }).startWith(LoadingCashierFeatureState(_currentStateModel));

    final statesBehavior = BehaviorSubject<CashierFeatureStates>()..addStream(states);

    _currentState = statesBehavior;

    return CashierFeatureBloc._(events: eventsBehavior.sink, states: statesBehavior);
  }

  static Stream<CashierFeatureStates> _eventHandler(CashierFeatureEvents event) async* {
    if (event is LoadAllInvoicesToListEvent) {
      yield* _loadAllInvoicesToListEvent(event);
    } else if (event is PaginateInvoiceEvent) {
      yield* _paginateInvoiceEvent(event);
    }
  }

  static Stream<CashierFeatureStates> _loadAllInvoicesToListEvent(
    LoadAllInvoicesToListEvent event,
  ) async* {
    try {
      yield LoadingCashierFeatureState(_currentStateModel);
      final invoices = await _iCashierFeatureRepo.invoices();
      _currentStateModel.clearData();
      _currentStateModel.setToAllCustomerInvoices(invoices);
      _currentStateModel.paginate();
      yield LoadedCashierFeatureState(_currentStateModel);
    } catch (e) {
      yield ErrorCashierFeatureState(_currentStateModel);
    }
  }

  static Stream<CashierFeatureStates> _paginateInvoiceEvent(
    PaginateInvoiceEvent event,
  ) async* {
    try {
      _currentStateModel.paginate();
      yield* _emitter();
    } catch (e) {
      yield ErrorCashierFeatureState(_currentStateModel);
    }
  }

  static Stream<CashierFeatureStates> _emitter() async* {
    if (_currentState.value is LoadingCashierFeatureState) {
      yield LoadingCashierFeatureState(_currentStateModel);
    } else if (_currentState.value is ErrorCashierFeatureState) {
      yield ErrorCashierFeatureState(_currentStateModel);
    } else if (_currentState.value is LoadedCashierFeatureState) {
      yield LoadedCashierFeatureState(_currentStateModel);
    }
  }
}
