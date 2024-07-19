import 'package:floor/floor.dart';

@Entity(tableName: 'data')
class JsonToStore {
  @primaryKey
  final String json;
  JsonToStore({
    required this.json,
  });
}
