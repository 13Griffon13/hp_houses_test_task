import 'package:flutter/material.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/house_info.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';

class HouseButton extends StatelessWidget {
  final House house;
  final Function() onPress;

  const HouseButton({
    super.key,
    required this.house,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height / 12;
    return Container(
      padding: const EdgeInsets.all(2.0),
      constraints: BoxConstraints(
        minHeight: size,
        maxHeight: 160.0,
        minWidth: 200.0,
        maxWidth: double.infinity,
      ),
      child: OutlinedButton(
        onPressed: onPress,
        child: Text(house.presentableName),
      ),
    );
  }
}
