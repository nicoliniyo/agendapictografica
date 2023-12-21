
import 'package:app/data/pec.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {

  Future<Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'pecs.db'),
      onCreate: (db, version) {
         db.execute(
            'CREATE TABLE pecs('
                'id INTEGER PRIMARY KEY, '
                'keywords TEXT, '
                'description TEXT, '
                'categories TEXT,'
                'tags TEXT,'
                'creation TEXT,'
                'imgUrl TEXT,'
                'localImgPath TEXT'
                ');'
            );
         db.execute(
             'CREATE TABLE hoy('
                'id INTEGER PRIMARY KEY,'
                'pathImage TEXT'
                ');'
             );
      },
      version: 1,
    );
    return db;
  }

  Future<List<Pec>> loadPecs() async {
    final db = await getDatabase();
    final data = await db.query('pecs');
    return data
        .map(
          (row) => Pec.withImage(
            row['id'] as int,
            row['keywords'] as String,
            row['description'] as String,
            row['categories'] as String,
            row['tags'] as String,
            row['creation'] as String,
            row['imgUrl'] as String,
            row['localImgPath'] as String,
        ),
      ).toList();

  }
}
