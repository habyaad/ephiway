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

    return result;
  }

  Future<List<Map<String, Object?>>?> checkEmailExistence(
      Map<String, dynamic> user) async {
    var dbClient = await db;
    List<Map<String, Object?>>? result = await dbClient
        ?.query("users", where: "email = ?", whereArgs: [user["email"]]);

    return result;
  }

  Future<int?> signUpUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    try {
      List<Map<String, Object?>>? exists = await checkEmailExistence(user);
      getIt<Logger>().d(exists);
      if (exists!.isEmpty) {

        int? registered = await dbClient?.insert('users', user);
        if(registered != null){
          getIt<Logger>()
              .d("${user["username"]} registered successfully at index $registered");
          return registered;
        }

      }
    } catch (e) {
      getIt<Logger>().e(e);
      return null;
    }
    return null;
  }

  Future<int?> signInUser(Map<String, dynamic> user) async {
    try {
      getIt<Logger>().d(user);

      List<Map<String, Object?>>? exists = await checkUserExistence(user);
      getIt<Logger>().d(exists);
      if (exists!.isNotEmpty) {
        getIt<Logger>().d("${user["email"]} login successful");
        return 1;
      }
    } catch (e) {
      getIt<Logger>().e(e);
      return null;
    }

    getIt<Logger>().e("wrong credentials");
    return null;
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
