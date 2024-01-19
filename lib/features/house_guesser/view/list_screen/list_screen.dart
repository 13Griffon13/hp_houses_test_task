import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/list_screen/cubit/list_screen_cubit.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/list_screen/cubit/list_screen_state.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/widgets/guess_card.dart';
import 'package:test_task_hp_houses/locales/strings.dart';
import 'package:test_task_hp_houses/navigation/app_router.dart';

@RoutePage()
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final ListScreenCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ListScreenCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListScreenCubit, ListScreenState>(
      bloc: cubit,
      listener: (context, state) {},
      builder: (context, state) {
        final items = <CharacterEntity>[];
        if (state.searchResult == null) {
          items.addAll(state.characters);
        } else {
          items.addAll(state.searchResult!);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GuessCard(
                    title: Strings.total,
                    subtitle: state.totalGuesses.total.toString(),
                  ),
                  GuessCard(
                    title: Strings.failed,
                    subtitle: state.totalGuesses.incorrect.toString(),
                  ),
                  GuessCard(
                    title: Strings.success,
                    subtitle: state.totalGuesses.correct.toString(),
                  ),
                ],
              ),
              SearchBar(
                trailing: const [
                  Icon(Icons.search),
                ],
                onChanged: (text) {
                  cubit.searchRequestUpdated(text);
                },
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      onTap: () {
                        context.pushRoute(DetailsRoute(characterEntity: item));
                      },
                      leading: item.image.isEmpty
                          ? const Icon(Icons.person)
                          : Image.network(item.image),
                      title: Text(item.name),
                      subtitle:
                          Text('${Strings.attempts}:${item.guesses.total}'),
                      trailing: item.guesses.correct > 0
                          ? const Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      context
                                          .read<HomeScreenCubit>()
                                          .loadCharacter(item);
                                      context.navigateTo(const HomeRoute());
                                    },
                                    child: const Icon(
                                      Icons.update,
                                    )),
                                const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
