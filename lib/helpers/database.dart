import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart' as path;

class DataBaseHelper {
  static Future<sql.Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'note.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE note_user(id TEXT PRIMARY KEY,title TEXT,description TEXT)');
    }, version: 1);
  }

  static Future<void> insertData(
      String table, Map<String, dynamic> data) async {
    final db = await DataBaseHelper.dataBase();
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await dataBase();
    final result = await db.query(table);
    await db.close();
    return result;
  }

  static Future<int> deleteData(String table, String id) async {
    final db = await DataBaseHelper.dataBase();
    final result = await db.delete(table, where: 'id = ?', whereArgs: [id]);
    await db.close();
    return result;
  }

  static Future<int> updateData(
      String table, Map<String, dynamic> note, String id) async {
    final db = await DataBaseHelper.dataBase();
    final result =
        await db.update(table, note, where: 'id = ?', whereArgs: [id]);
    await db.close();
    return result;
  }
}
