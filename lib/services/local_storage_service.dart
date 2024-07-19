import 'package:floor/floor.dart';
import '../data/models/json_to_store_model.dart';

@dao
abstract class DataDao {
  @Query('SELECT * FROM data')
  Future<JsonToStore?> getStoredData();

  @insert
  Future<void> insertData(JsonToStore data);
  @Query('DELETE FROM data')
  Future<void> deleteAllData();
}
