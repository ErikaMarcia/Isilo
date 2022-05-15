import 'dart:async';
import 'package:floor/floor.dart';
import 'package:isilo/models/asylum.dart';
import 'package:isilo/interfaces/asylum_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Asylum])
abstract class AsylumDatabase extends FloorDatabase {
  AsylumDao get asylumnDao;
}
