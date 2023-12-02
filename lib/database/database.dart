import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    // if (_database == null) {
    //   _database = (await instance._insertStaticData()) as Database?;
    //   return _database!;
    // }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'building_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE buildings(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        floors INTEGER
      )
    ''');
  }

  Future<int> insertBuilding(Building building) async {
    final Database db = await database;
    return await db.insert('buildings', building.toMap());
  }

  Future<List<Building>> getBuildings(b) async {
    final Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('buildings');

    return List.generate(maps.length, (i) {
      return Building(
        id: maps[i]['id'],
        name: maps[i]['name'],
        floors: maps[i]['floors'],
      );
    });
  }

  // Future<List<Map<String, dynamic>>> _insertStaticData() async {
  //   Database db = await database;
  //   List<Map<String, dynamic>> staticData = [
  //     {'name': 'one', 'floors': 5},
  //     {'name': 'two', 'floors': 9},
  //   ];

  //   for (var maps in staticData) {
  //     await db.insert('buildings', maps);
  //   }

  //   return staticData;
  // }
}

class Building {
  final int? id;
  final String name;

  final int floors;

  Building({this.id, required this.name, required this.floors});

  Map<String, dynamic> toMap({required}) {
    return {
      'name': name,
      'floors': floors,
    };
  }
}

Future<void> clearTable() async {
  Database database = await openDatabase(
    join(await getDatabasesPath(), 'building_database.db'),
    version: 1,
  );

  await database.rawDelete('DELETE FROM buildings');
}

// Викликати цю функцію, коли потрібно очистити таблицю
// await clearTable();