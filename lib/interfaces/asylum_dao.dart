import 'package:floor/floor.dart';
import 'package:isilo/interfaces/repository_dao_interface.dart';
import 'package:isilo/models/asylum.dart';

@dao
abstract class AsylumDao extends IRepositoryDaoInterface<Asylum> {
  @Query('SELECT * FROM Asylum WHERE id = :id')
  Future<Asylum?> getById(int id);

  @Query('SELECT * FROM Asylum')
  Future<List<Asylum>> getAll();
}
