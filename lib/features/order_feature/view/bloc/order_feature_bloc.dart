import 'package:flutter/foundation.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_events.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/order_feature_states.dart';
import 'package:test_pos_app/features/order_feature/view/bloc/state_model/order_feature_state_model.dart';

@immutable
class OrderFeatureBloc {
  static late BehaviorSubject<OrderFeatureStates> _currentState;
  static late OrderFeatureStateModel _currentStateModel;

  final Sink<OrderFeatureEvents> events;
  final BehaviorSubject<OrderFeatureStates> _states;

  Stream<OrderFeatureStates> get state => _states;

  const OrderFeatureBloc._({
    required this.events,
    required BehaviorSubject<OrderFeatureStates> states,
  }) : _states = states;

  factory OrderFeatureBloc() {
    _currentStateModel = OrderFeatureStateModel();

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
    }
  }

  static Stream<OrderFeatureStates> _addPlaceEvent(AddPlaceEvent event) async* {
    _currentStateModel.setPlace(event.place);
    yield InitialOrderFeatureState(_currentStateModel);
  }
}
