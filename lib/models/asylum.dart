import 'package:floor/floor.dart';

@entity
class Asylum {
  Asylum(
      this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.image,
      this.whatsApp,
      this.about,
      this.instructions,
      this.openingHours,
      this.openOnWeekends);

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;
  final String latitude;
  final String longitude;
  final String image;
  final String whatsApp;
  final String about;
  final String instructions;
  final String openingHours;
  final bool openOnWeekends;
}
