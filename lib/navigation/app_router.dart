import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/bloc_provider.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/home_screen/home_screen.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/list_screen/list_screen.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/tabs_menu.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/details_screen/details_screen.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: CharactersBlocProviderRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: TabMenuRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page),
                AutoRoute(page: ListRoute.page),
              ],
            ),
            AutoRoute(page: DetailsRoute.page),
          ],
        ),
      ];
}
