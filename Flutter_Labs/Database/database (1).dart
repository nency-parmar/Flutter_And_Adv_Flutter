import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static Database? _database;

  Future<Database> initDatabase() async {
    if (_database != null) {
      return _database!;
    }

    Directory directory = await getApplicationCacheDirectory();
    String path = join(directory.path, 'ToDoList.db');

    _database = await openDatabase(
      path,
      version: 1, // ✅ Ensure a version is specified
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE AddWork(
           work_id INTEGER PRIMARY KEY AUTOINCREMENT,
           work_name TEXT NOT NULL
          )''');
      },
      onUpgrade: (db, oldVersion, newVersion) {},
    );

    return _database!;
  }

  Future<List<Map<String, dynamic>>> selectAllState() async {
    Database db = await initDatabase();
    return await db.rawQuery("SELECT * FROM AddWork");
  }

  Future<void> insertState(Map<String, dynamic> todoList) async {
    Database db = await initDatabase();
    await db.insert("AddWork", todoList);
  }

  Future<void> deleteWork(int index) async{
    Database db = await initDatabase();
    await db.delete("AddWork" , where: 'work_id = ?' , whereArgs: [index]);
  }

  Future<void> editWork(Map<String, dynamic> todoList) async{
    Database db = await initDatabase();
    await db.update("AddWork" , todoList , where:  'work_id = ?' , whereArgs: [todoList['work_id']]);
  }
}
