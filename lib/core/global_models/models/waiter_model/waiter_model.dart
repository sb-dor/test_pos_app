import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_pos_app/core/global_models/entities/waiter.dart';

part 'waiter_model.freezed.dart';

part 'waiter_model.g.dart';

@freezed
class WaiterModel extends Waiter with _$WaiterModel {
  const factory WaiterModel({int? id, String? name}) = _WaiterModel;

  factory WaiterModel.fromJson(Map<String, Object?> json) => _$WaiterModelFromJson(json);

  factory WaiterModel.fromDb(Map<String, dynamic> db) => const WaiterModel();
}
