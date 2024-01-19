import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/cubit/house_guesser_cubit.dart';
import 'package:test_task_hp_houses/locales/strings.dart';
import 'package:test_task_hp_houses/navigation/app_router.dart';

@RoutePage(name: 'TabMenuRoute')
class TabMenu extends StatelessWidget {
  const TabMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ListRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(_titleSelector(tabsRouter.activeIndex)),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {
                  context.read<HouseGuesserCubit>().resetGuesses();
                },
                child: Text(Strings.reset),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: Strings.home,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.list),
                label: Strings.list,
              ),
            ],
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }

  String _titleSelector(int tabIndex) {
    return switch (tabIndex) {
      0 => Strings.homeScreenTitle,
      1 => Strings.listScreenTitle,
      _ => '',
    };
  }
}
