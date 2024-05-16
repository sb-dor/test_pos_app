import 'package:test_pos_app/core/global_models/entities/waiter.dart';

class WaiterModel extends Waiter {
  const WaiterModel({super.id, super.name});

  factory WaiterModel.fromDb(Map<String, dynamic> db) => WaiterModel();
}
