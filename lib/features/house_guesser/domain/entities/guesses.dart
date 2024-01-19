import 'package:freezed_annotation/freezed_annotation.dart';

part 'guesses.freezed.dart';

@freezed
class GuessesEntity with _$GuessesEntity {
  const factory GuessesEntity({
    @Default(0) int correct,
    @Default(0) int incorrect,
    @Default(0) int total,
  }) = _GuessesEntity;
}
