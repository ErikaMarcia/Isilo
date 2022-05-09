import 'package:floor/floor.dart';
import 'package:isilo/models/asylum.dart';

@dao
abstract class AsylumnDao {
  
  @Query('SELECT * FROM Asylum')
  Future<List<Asylum>> findAllAsylums();

  @Query('SELECT * FROM Asylum WHERE id = :id')
  Stream<Asylum?> findAsylumById(int id);

  @insert
  Future<void> insertAsylum(Asylum asylum);
}
