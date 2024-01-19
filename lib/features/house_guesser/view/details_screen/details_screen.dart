import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/character_entity.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/house_info.dart';
import 'package:test_task_hp_houses/features/house_guesser/domain/entities/wand_entity.dart';
import 'package:test_task_hp_houses/locales/strings.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final CharacterEntity characterEntity;

  const DetailsScreen({
    super.key,
    required this.characterEntity,
  });

  @override
  Widget build(BuildContext context) {
    final infoAvailable = characterEntity.guesses.correct > 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(characterEntity.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: characterEntity.image.isNotEmpty
                  ? Image.network(characterEntity.image)
                  : const Icon(Icons.person),
            ),
            ResponsiveGridCol(
              xs: 6,
              md: 4,
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: infoAvailable
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '${Strings.wizard}: ${_boolToString(characterEntity.wizard)}'),
                            Text(
                                '${Strings.house}: ${characterEntity.house.presentableName}'),
                            Text(
                                '${Strings.dateOfBirth}: ${characterEntity.dateOfBirth}'),
                            Text(
                                '${Strings.gender}: ${characterEntity.gender}'),
                            Text(
                                '${Strings.specie}: ${characterEntity.species}'),
                            Text(
                                '${Strings.ancestry}: ${characterEntity.ancestry}'),
                            Text(
                                '${Strings.eyeColor}: ${characterEntity.eyeColour}'),
                            Text(
                                '${Strings.hairColor}: ${characterEntity.hairColour}'),
                            Text(
                                '${Strings.patronus}: ${characterEntity.patronus}'),
                            Text(
                                '${Strings.hogwartsStaff}: ${_boolToString(characterEntity.hogwartsStaff)}'),
                            Text(
                                '${Strings.hogwartsStudent}: ${_boolToString(characterEntity.hogwartsStudent)}'),
                            Text(
                                '${Strings.alive}: ${_boolToString(characterEntity.alive)}'),
                          ],
                        )
                      : Text(
                          Strings.accessDenied,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        )),
            ),
            ResponsiveGridCol(
              xs: 12,
              md: 6,
              child: Offstage(
                offstage: !infoAvailable,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_wandToFormattedString(characterEntity.wand)),
                      Text('${Strings.actor}: ${characterEntity.actor}'),
                      Text('${Strings.alternateActors}: ${_alternateActors()}'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _wandToFormattedString(WandEntity wand) {
    var result = '''${Strings.wand}: 
            ${Strings.wood}: ${wand.wood}
            ${Strings.length}: ${wand.length}
            ${Strings.core}: ${wand.core}
''';
    return result;
  }

  String _boolToString(bool value) {
    return value ? Strings.yes : Strings.no;
  }

  String _alternateActors() {
    var result = '';
    for (var element in characterEntity.alternateActors) {
      result = '$result $element \n';
    }
    return result;
  }
}
