import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'fields.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE field_models(id TEXT PRIMARY KEY, title TEXT, isTrue INT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  static Future<void> update(String id, bool _isTrue) async {
    final db = await DBHelper.database();
    db.rawUpdate(
        'UPDATE field_models SET isTrue = ? WHERE id = ?', [_isTrue, id]);
  }
}
