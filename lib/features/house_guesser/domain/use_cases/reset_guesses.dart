import 'package:dartz/dartz.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/core/domain/use_cases/use_case.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';

class ResetGuessesUseCase extends UseCase<bool, void> {
  final GuessesRepository guessesRepository;

  ResetGuessesUseCase({required this.guessesRepository});

  @override
  Future<Either<Failure, bool>> call([void params]) {
    return guessesRepository.resetGuesses();
  }
}
