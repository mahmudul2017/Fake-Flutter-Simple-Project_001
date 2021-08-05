import 'dart:io' as io;
import 'package:flutter_firstproject/model/AppsList.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqFliteHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE_NAME = 'apps';
  static const String DB_NAME = 'apps.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, DB_NAME);
    var dbOpen = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dbOpen;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE_NAME ($ID INTEGER PRIMARY KEY, $NAME TEXT)");
  }

  Future<AppsList> saveToDB(AppsList appsList) async {
    var dbClient = await db;
    appsList.id = await dbClient.insert(TABLE_NAME, appsList.toMap());
    return appsList;
  }

  Future<List<AppsList>> getAppsListToDB() async {
    var dbClient = await db;
    List<Map> mapList = await dbClient.query(TABLE_NAME, columns: [ID, NAME]);
    List<AppsList> appsList = [];

    if (mapList.length > 0) {
      for (int i = 0; i < mapList.length; i++) {
        appsList.add(AppsList.fromMap(mapList[i]));
      }
    }
    return appsList;
  }

  Future<int> deleteToDB(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE_NAME, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> updateToDB(AppsList appsList) async {
    var dbClient = await db;
    return await dbClient.update(TABLE_NAME, appsList.toMap(),
        where: '$ID = ?', whereArgs: [appsList.id]);
  }

  Future closeDB() async {
    var dbClient = await db;
    dbClient.close();
  }
}
