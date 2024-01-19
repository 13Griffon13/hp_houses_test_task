import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_hp_houses/core/view/widgets/failure_dialog.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/cubit/home_screen_cubit.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/cubit/home_screen_state.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/widgets/guess_card.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/widgets/house_picker.dart';
import 'package:test_task_hp_houses/locales/strings.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenCubit cubit;
  final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    cubit = context.read<HomeScreenCubit>();
    _loadCharacter();
  }

  Future _loadCharacter() async {
    _refreshKey.currentState?.show();
    return cubit.getRandomCharacter();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 3;
    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: _loadCharacter,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
            bloc: cubit,
            listener: (context, state) {
              if (state.error != null) {
                showDialog(
                  context: context,
                  builder: (context) => FailureDialog(failure: state.error!),
                );
              }
            },
            builder: (context, state) {
              if (state.selectedCharacter != null) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GuessCard(
                          title: Strings.total,
                          subtitle:
                              state.selectedCharacter!.guesses.total.toString(),
                        ),
                        GuessCard(
                          title: Strings.success,
                          subtitle: state.selectedCharacter!.guesses.correct
                              .toString(),
                        ),
                        GuessCard(
                          title: Strings.failed,
                          subtitle: state.selectedCharacter!.guesses.incorrect
                              .toString(),
                        ),
                      ],
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 100,
                        maxHeight: size,
                      ),
                      child: state.selectedCharacter!.image.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.network(
                                state.selectedCharacter!.image,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.error),
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: 180.0,
                            ),
                    ),
                    Text(
                      state.selectedCharacter!.name,
                    ),
                    HousePicker(
                      onSelected: (house) {
                        cubit.houseSelected(house);
                      },
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(Strings.unableToLoadTheCharacter),
                );
              }
            }),
      ),
    );
  }
}
