import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/guesses.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/list_screen/cubit/list_screen_state.dart';

class ListScreenCubit extends Cubit<ListScreenState> {
  final GuessesRepository guessesRepository;
  late final StreamSubscription _guessesSubscription;
  final StreamController<String> _searchController = StreamController();
  late final StreamSubscription<String> _onSearch;

  ListScreenCubit({
    required this.guessesRepository,
  }) : super(const ListScreenState()) {
    _guessesSubscription = guessesRepository.guessedCharacters.listen(
      (event) {
        var totalGuesses = const GuessesEntity();
        event.forEach((key, value) {
          totalGuesses = totalGuesses.copyWith(
            total: totalGuesses.total + value.guesses.total,
            correct: totalGuesses.correct + value.guesses.correct,
            incorrect: totalGuesses.incorrect + value.guesses.incorrect,
          );
        });
        _updateCharactersList(
          event.values.toList(),
          totalGuesses,
        );
      },
    );
    _onSearch = _searchController.stream
        .debounceTime(const Duration(seconds: 1))
        .listen(
      (event) {
        _performSearch();
      },
    );
  }

  void searchRequestUpdated(String newRequest) {
    emit(state.copyWith(searchRequest: newRequest.toLowerCase()));
    _searchController.sink.add(newRequest.toLowerCase());
  }

  void _updateCharactersList(
      List<CharacterEntity> characters, GuessesEntity totalGuesses) {
    emit(state.copyWith(
      characters: characters,
      searchResult: null,
      totalGuesses: totalGuesses,
    ));
  }

  void _performSearch() {
    final result = state.characters.where(
        (element) => element.name.toLowerCase().contains(state.searchRequest));
    emit(state.copyWith(searchResult: result.toList()));
  }

  @override
  Future<void> close() {
    _guessesSubscription.cancel();
    _searchController.close();
    _onSearch.cancel();
    return super.close();
  }
}
