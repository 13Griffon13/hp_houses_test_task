import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/guesses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/get_random_character.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/guess_house.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/cubit/home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final GetRandomCharacterUseCase getRandomCharacterUseCase;
  final GuessHouseUseCase guessHouseUseCase;
  final GuessesRepository guessesRepository;
  late final StreamSubscription _guessSubscription;

  HomeScreenCubit({
    required this.guessesRepository,
    required this.getRandomCharacterUseCase,
    required this.guessHouseUseCase,
  }) : super(const HomeScreenState()) {
    getRandomCharacterUseCase().then((value) {
      value.fold(
        (l) => null,
        (r) {
          emit(state.copyWith(selectedCharacter: r));
        },
      );
    });
    _guessSubscription = guessesRepository.guessedCharacters.listen((event) {
      if (event.containsKey(state.selectedCharacter?.id)) {
        _updateCharacter(event[state.selectedCharacter!.id]!);
      } else {
        if (event.isEmpty) {
          _updateCharacter(state.selectedCharacter!
              .copyWith(guesses: const GuessesEntity()));
        }
      }
    });
  }

  Future<void> getRandomCharacter() async {
    final result = await getRandomCharacterUseCase();
    _setCharacter(result);
  }

  void houseSelected(House house) async {
    if (state.selectedCharacter != null) {
      final result = await guessHouseUseCase(
        Params(
          character: state.selectedCharacter!,
          house: house,
        ),
      );
      result.fold(
        (l) {
          emit(state.copyWith(error: l));
          emit(state.copyWith(error: null));
        },

        ///we don't need right here as our statistic will be updated via subscription
        (r) => null,
      );
    }
  }

  void _updateCharacter(CharacterEntity characterEntity) {
    emit(state.copyWith(selectedCharacter: characterEntity));
  }

  void loadCharacter(CharacterEntity character) {
    emit(state.copyWith(selectedCharacter: character));
  }

  ///Helper method to avoid repetitive code(folding)
  void _setCharacter(Either<Failure, CharacterEntity> obtainedInfo) {
    obtainedInfo.fold(
      (l) {
        emit(state.copyWith(error: l, selectedCharacter: null));
        emit(state.copyWith(error: null));
      },
      (r) {
        emit(state.copyWith(selectedCharacter: r));
      },
    );
  }

  @override
  Future<void> close() {
    _guessSubscription.cancel();
    return super.close();
  }
}
