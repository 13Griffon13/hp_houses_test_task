import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wand_entity.freezed.dart';

@freezed
class WandEntity with _$WandEntity {
  const factory WandEntity({
    required String wood,
    required String core,
    num? length,
  }) = _WandEntity;
}
