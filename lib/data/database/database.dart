import 'dart:async';

import 'package:floor/floor.dart';
import '../../services/local_storage_service.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../models/json_to_store_model.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [JsonToStore])
abstract class AppDatabase extends FloorDatabase {
  DataDao get dataDao;
}
