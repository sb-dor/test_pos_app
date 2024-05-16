import 'package:flutter/foundation.dart';
import 'package:test_pos_app/core/global_models/entities/place.dart';

@immutable
class OrderFeatureEvents {}

class AddPlaceEvent extends OrderFeatureEvents {
  final Place? place;

  AddPlaceEvent(this.place);
}
