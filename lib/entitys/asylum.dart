import 'package:floor/floor.dart';

@entity
class Asylum {
  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  final int latitude;
  final int longitude;
  final String about;
  final String instructions;
  final String openingHours;
  final bool openOnWeekends;

  Asylum(this.id, this.name, this.latitude, this.longitude, this.about,
      this.instructions, this.openingHours, this.openOnWeekends);
}
