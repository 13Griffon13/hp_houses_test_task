import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/wand_entity.dart';

part 'wand_model.freezed.dart';

part 'wand_model.g.dart';

@freezed
class WandModel with _$WandModel {
  const WandModel._();

  const factory WandModel({
    required String wood,
    required String core,
    num? length,
  }) = _WandModel;

  factory WandModel.fromJson(Map<String, dynamic> json) =>
      _$WandModelFromJson(json);

  WandEntity get entity => WandEntity(
        wood: wood,
        core: core,
        length: length,
      );
}
