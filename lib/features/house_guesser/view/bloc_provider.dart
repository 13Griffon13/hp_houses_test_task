import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_hp_houses/core/di_container.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/repositories/guesses_repository.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/get_random_character.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/guess_house.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/use_cases/reset_guesses.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/cubit/house_guesser_cubit.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/list_screen/cubit/list_screen_cubit.dart';

@RoutePage(name: 'CharactersBlocProviderRoute')
class CharactersBlocProvider extends StatelessWidget
    implements AutoRouteWrapper {
  const CharactersBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit(
            guessesRepository: getIt.get<GuessesRepository>(),
            getRandomCharacterUseCase: getIt.get<GetRandomCharacterUseCase>(),
            guessHouseUseCase: getIt.get<GuessHouseUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => ListScreenCubit(
            guessesRepository: getIt.get<GuessesRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HouseGuesserCubit(
            resetGuessesUseCase: getIt.get<ResetGuessesUseCase>(),
          ),
        ),
      ],
      child: this,
    );
  }
}
