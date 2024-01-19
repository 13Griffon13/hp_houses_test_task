import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/reset_guesses.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/cubit/house_guesser_state.dart';

class HouseGuesserCubit extends Cubit<HouseGuesserState> {
  final ResetGuessesUseCase resetGuessesUseCase;

  HouseGuesserCubit({
    required this.resetGuessesUseCase,
  }) : super(const HouseGuesserState());

  void resetGuesses() {
    resetGuessesUseCase();
  }
}
