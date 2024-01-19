import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/features/house_guesser/view/widgets/house_button.dart';

class HousePicker extends StatelessWidget {
  final Function(House house) onSelected;

  const HousePicker({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 3.5;

    return ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 200.0,
          maxWidth: double.infinity,
          minHeight: size,
          maxHeight: size,
        ),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              child: HouseButton(
                house: House.gryffindor,
                onPress: () {
                  onSelected(House.gryffindor);
                },
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              child: HouseButton(
                house: House.slytherin,
                onPress: () {
                  onSelected(House.slytherin);
                },
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              child: HouseButton(
                house: House.ravenclaw,
                onPress: () {
                  onSelected(House.ravenclaw);
                },
              ),
            ),
            ResponsiveGridCol(
              xs: 6,
              child: HouseButton(
                house: House.hufflepuff,
                onPress: () {
                  onSelected(House.hufflepuff);
                },
              ),
            ),
            ResponsiveGridCol(
              lg: 12,
              child: HouseButton(
                house: House.noHouse,
                onPress: () {
                  onSelected(House.noHouse);
                },
              ),
            ),
          ],
        ));
  }
}
