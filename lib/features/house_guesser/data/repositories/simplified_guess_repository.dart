import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/service/hp_api_service.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';

class SimplifiedGuessRepository extends GuessesRepository {
  Map<String, CharacterEntity> _guesses = {};

  final BehaviorSubject<Map<String, CharacterEntity>> _guessesController =
      BehaviorSubject();

  final HPApiService hpApiService;

  SimplifiedGuessRepository({
    required this.hpApiService,
  });

  @override
  Stream<Map<String, CharacterEntity>> get guessedCharacters =>
      _guessesController.stream;

  @override
  Map<String, CharacterEntity> get guesses => _guesses;

  @override
  Future<Either<Failure, bool>> resetGuesses() async {
    _guesses = {};
    _guessesController.add(_guesses);
    return right(true);
  }

  @override
  Future<Either<Failure, CharacterEntity>> guessHouse(
      CharacterEntity character, House house) async {
    try {
      if (character.house == house) {
        _guesses[character.id] = character.copyWith(
          guesses: character.guesses.copyWith(
            correct: character.guesses.correct + 1,
            total: character.guesses.total + 1,
          ),
        );
      } else {
        _guesses[character.id] = character.copyWith(
          guesses: character.guesses.copyWith(
            incorrect: character.guesses.incorrect + 1,
            total: character.guesses.total + 1,
          ),
        );
      }
      _guessesController.sink.add(_guesses);
      return right(_guesses[character.id]!);
    } catch (e) {
      return left(Failure.fromObject(e));
    }
  }

  @override
  void close() {
    _guessesController.close();
  }
}
