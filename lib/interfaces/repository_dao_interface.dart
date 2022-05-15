import 'package:floor/floor.dart';
import 'package:isilo/models/asylum.dart';

@dao
abstract class IRepositoryDaoInterface <Table extends Asylum> {

  @insert
  Future<int> insertAsylum(Table item);

  @update
  Future<int> updateAsylum(Table item);

  @delete
  Future<int> deleteAsylum(Table item);
}
