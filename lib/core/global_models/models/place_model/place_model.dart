import 'package:test_pos_app/core/global_models/entities/place.dart';

class PlaceModel extends Place {
  const PlaceModel({
    super.id,
    super.name,
    super.vip,
    super.icon,
    super.color,
  });

  factory PlaceModel.fromDb(Map<String, dynamic> db) => PlaceModel();
}
