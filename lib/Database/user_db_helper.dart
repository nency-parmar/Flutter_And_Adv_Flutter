import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import 'package:matrimony_application/Design/utils/user.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' if (dart.library.io) 'dart:io';

class UserDBHelper {
  static final UserDBHelper instance = UserDBHelper._internal(); // ✅ Add this
  UserDBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<void> checkTableStructure() async {
    final db = await UserDBHelper.instance.database;
    List<Map<String, dynamic>> result = await db.rawQuery("PRAGMA table_info(users)");

    print("Users Table Structure:");
    for (var row in result) {
      print(row);  // Print each column's details
    }
  }

  Future<Database> initDB() async {
    DatabaseFactory dbFactory;

    if (kIsWeb) {
      dbFactory = databaseFactoryFfiWeb;
    } else {
      sqfliteFfiInit();
      dbFactory = databaseFactoryFfi;
    }

    String dbPath;
    if (kIsWeb) {
      dbPath = 'users.db';
    } else {
      final databasesPath = await getDatabasesPath();
      dbPath = join(databasesPath, 'users.db');

      if (!await Directory(databasesPath).exists()) {
        await Directory(databasesPath).create(recursive: true);
      }
    }

    final db = await dbFactory.openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: 3,  // 🔥 Increment version number
        onCreate: (Database db, int version) async {
          await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT,
            city TEXT,
            hobbies TEXT,
            gender TEXT,
            num TEXT,
            age INTEGER,  
            pass TEXT,
            religion TEXT,
            qualification TEXT,
            occupation TEXT,
            isFavorite INTEGER DEFAULT 0  -- ✅ Ensure isFavorite is in table creation
          )
        ''');
        },
          onUpgrade: (Database db, int oldVersion, int newVersion) async {
            if (oldVersion < 2) {
              await db.execute('ALTER TABLE users ADD COLUMN age INTEGER;');
              print("✅ Column 'age' added successfully!");
            }

            // ✅ Check if 'isFavorite' already exists before adding
            if (oldVersion < 3) {
              List<Map<String, dynamic>> columns = await db.rawQuery("PRAGMA table_info(users)");
              bool columnExists = columns.any((column) => column['name'] == 'isFavorite');

              if (!columnExists) {
                await db.execute('ALTER TABLE users ADD COLUMN isFavorite INTEGER DEFAULT 0;');
                print("✅ Column 'isFavorite' added successfully!");
              } else {
                print("⚠️ Column 'isFavorite' already exists!");
              }
            }
          }
      ),
    );

    return db;
  }

  Future<int> addUser(AppUser user) async {
    final db = await instance.database;  // ✅ Use `instance.database`
    return await db.insert('users', user.toMap());
  }

  Future<List<AppUser>> getUsers() async {
    final db = await instance.database;  // ✅ Use `instance.database`
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) => AppUser.fromMap(maps[i]));
  }

  Future<int> updateUser(AppUser user) async {
    final db = await instance.database;

    if (user.id == null) {
      print("Error: User ID is null. Cannot update user.");
      return 0; // Return failure
    }

    print("Updating user with ID: ${user.id}");

    try {
      int result = await db.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );

      if (result > 0) {
        print("User updated successfully: ${user.name}");
      } else {
        print("Warning: No user updated. Check if the ID exists.");
      }

      return result;
    } catch (e) {
      print("Error while updating user: $e");
      return 0; // Return failure in case of exception
    }
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;  // ✅ Use `instance.database`
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> toggleFavorite(int id, bool isFavorite) async {
    final db = await instance.database;
    return await db.update(
      'users',
      {'isFavorite': isFavorite ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<List<AppUser>> getFavoriteUsers() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'isFavorite = ?',
      whereArgs: [1],  // Fetch only favorite users
    );

    return List.generate(maps.length, (i) => AppUser.fromMap(maps[i]));
  }
}