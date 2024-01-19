import 'package:get_it/get_it.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/repositories/api_character_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/repositories/simplified_guess_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/data/service/hp_api_service.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/characters_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/get_random_character.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/guess_house.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/reset_guesses.dart';

final getIt = GetIt.instance;

void diInit() {
  ///Services
  getIt.registerLazySingleton<HPApiService>(() => HPApiService.instance);

  ///Repos
  getIt.registerLazySingleton<CharactersRepository>(
    () => ApiCharactersRepository(
      apiService: getIt.get<HPApiService>(),
    ),
  );
  getIt.registerLazySingleton<GuessesRepository>(
    () => SimplifiedGuessRepository(
      hpApiService: getIt.get<HPApiService>(),
    ),
  );

  ///Use cases
  getIt.registerLazySingleton<GetRandomCharacterUseCase>(
    () => GetRandomCharacterUseCase(
      charactersRepository: getIt.get<CharactersRepository>(),
    ),
  );
  getIt.registerLazySingleton<GuessHouseUseCase>(
    () => GuessHouseUseCase(
      guessesRepository: getIt.get<GuessesRepository>(),
    ),
  );
  getIt.registerLazySingleton<ResetGuessesUseCase>(
    () => ResetGuessesUseCase(
      guessesRepository: getIt.get<GuessesRepository>(),
    ),
  );
}
