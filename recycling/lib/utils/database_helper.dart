import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite_dev.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _db;
  Future<Database> get database async =>
      _db ??= await initDB();
  Future<Database>initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "mydb.db");
    var myOwnDatabase =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return myOwnDatabase;
  }

  _onCreate(Database db,int version) async {
    var sql =
        "CREATE TABLE USER (User_MobileNumber TEXT PRIMARY KEY, Username TEXT, User_DateOfBirth TEXT, User_Email TEXT, User_Password TEXT) ";
    await db.execute(sql);
  }
}
