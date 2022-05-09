import 'dart:async';
import 'package:floor/floor.dart';
import 'package:isilo/entitys/asylum.dart';
import 'package:isilo/interfaces/asylum_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Asylum])
abstract class AppDatabase extends FloorDatabase {
  AsylumnDao get asylumnDao;
}
