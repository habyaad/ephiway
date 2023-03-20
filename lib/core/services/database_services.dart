import 'dart:async';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../utils/helpers.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    // Implement your database initialization logic here
    // You can create a new database file or open an existing one
    // You can also define your database schema and tables
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mydatabase.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)');
    });
  }

  Future<List<Map<String, Object?>>?> checkUserExistence(
      Map<String, dynamic> user) async {
    var dbClient = await db;
    List<Map<String, Object?>>? result = await dbClient?.query("users",
        where: "email = ? AND password = ?",
        whereArgs: [user["email"], user["password"]]);
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<int?> signUpUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    try {
      List<Map<String, Object?>>? exists = await checkUserExistence(user);
      getIt<Logger>().d(exists);
      if (exists!.isEmpty) {
        return await dbClient?.insert('users', user);
      } else {
        getIt<Logger>().e("email: ${user["email"]} already exist");
        return null;
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
    return null;
  }

  Future<int?> signInUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    try {
      getIt<Logger>().d(user);
      var users = await getAllUsers();
      getIt<Logger>().d(users);
      List<Map<String, Object?>>? exists = await checkUserExistence(user);
      getIt<Logger>().d(exists);
      if (exists!.isNotEmpty) {
        getIt<Logger>().d(
            "email: ${user["email"]} and password: ${user["password"]} exists");
        return 0;
      } else {
        getIt<Logger>().e("email doesn't exist.");
        return null;
      }
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

  Future getAllUsers() async {
    var dbClient = await db;
    try {
      List<Map<String, Object?>>? users = await dbClient?.query("users");
      getIt<Logger>().d(users);
      return users;
    } catch (e) {
      getIt<Logger>().e(e);
    }
  }

// Implement other database operations like updating, deleting, and querying users
}
