import 'package:flutter/foundation.dart';
import 'package:test_pos_app/features/order_feature/domain/repo/order_feature_repo.dart';
import 'package:test_pos_app/features/order_feature/domain/usecases/order_feature_adddb_usecase/order_feature_adddb_usecase.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_events.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_states.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/state_model/order_feature_state_model.dart';

@immutable
class OrderFeatureBloc {
  static late BehaviorSubject<OrderFeatureStates> _currentState;
  static late OrderFeatureStateModel _currentStateModel;
  static late OrderFeatureAddDbUsecase _addDbUsecase;

  final Sink<OrderFeatureEvents> events;
  final BehaviorSubject<OrderFeatureStates> _states;

  BehaviorSubject<OrderFeatureStates> get state => _states;

  const OrderFeatureBloc._({
    required this.events,
    required BehaviorSubject<OrderFeatureStates> states,
  }) : _states = states;

  factory OrderFeatureBloc({
    required OrderFeatureRepo orderFeatureRepo,
  }) {
    _currentStateModel = OrderFeatureStateModel();
    _addDbUsecase = OrderFeatureAddDbUsecase(orderFeatureRepo);

    final eventsBehavior = BehaviorSubject<OrderFeatureEvents>();

    final orderStream = eventsBehavior.switchMap<OrderFeatureStates>((events) async* {
      yield* _eventHandler(events);
    }).startWith(InitialOrderFeatureState(_currentStateModel));

    final orderBehavior = BehaviorSubject<OrderFeatureStates>()..addStream(orderStream);

    _currentState = orderBehavior;

    return OrderFeatureBloc._(events: eventsBehavior.sink, states: orderBehavior);
  }

  static Stream<OrderFeatureStates> _eventHandler(OrderFeatureEvents event) async* {
    if (event is AddPlaceEvent) {
      yield* _addPlaceEvent(event);
    } else if (event is SelectCategoryEvent) {
      yield* _selectCategoryEvent(event);
    } else if (event is AddProductToOrderEvent) {
      yield* _addProductToOrderEvent(event);
    } else if (event is DecrementOrderItemQtyEvent) {
      yield* _decrementOrderItemQtyEvent(event);
    } else if (event is FinishCustomerInvoice) {
      yield* _finishCustomerInvoice(event);
    }
  }

  static Stream<OrderFeatureStates> _addPlaceEvent(AddPlaceEvent event) async* {
    _currentStateModel.setPlace(event.place);
    final items = await _addDbUsecase.dbOrderItems(event.place);
    _currentStateModel.initOrders(items);
    yield InitialOrderFeatureState(_currentStateModel);
  }

  static Stream<OrderFeatureStates> _selectCategoryEvent(SelectCategoryEvent event) async* {
    _currentStateModel.chantShowingProductByCategory(event.category);
    yield InitialOrderFeatureState(_currentStateModel);
  }

  static Stream<OrderFeatureStates> _addProductToOrderEvent(AddProductToOrderEvent event) async* {
    final item = _currentStateModel.incrementOrderItem(event.product);
    await _addDbUsecase.addToDb(place: _currentStateModel.place, item: item);
    yield InitialOrderFeatureState(_currentStateModel);
  }

  static Stream<OrderFeatureStates> _decrementOrderItemQtyEvent(
      DecrementOrderItemQtyEvent event) async* {
    final item = _currentStateModel.decrementOrderItem(event.product);
    await _addDbUsecase.addToDb(place: _currentStateModel.place, item: item);
    yield InitialOrderFeatureState(_currentStateModel);
  }

  static Stream<OrderFeatureStates> _finishCustomerInvoice(FinishCustomerInvoice event) async* {
    final result = await _addDbUsecase.finishCustomerInvoice(_currentStateModel.place);
    if (result) _currentStateModel.clearData();
    yield InitialOrderFeatureState(_currentStateModel);
  }
}
