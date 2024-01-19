import 'package:test_task_hp_houses/features/house_guesser/domain/entities/houses.dart';
import 'package:test_task_hp_houses/locales/strings.dart';

extension HouseInfo on House {
  String get presentableName => switch (this) {
        House.gryffindor => Strings.gryffindor,
        House.slytherin => Strings.slytherin,
        House.hufflepuff => Strings.hufflepuff,
        House.ravenclaw => Strings.ravenclaw,
        House.noHouse => Strings.noHouse,
      };
}
