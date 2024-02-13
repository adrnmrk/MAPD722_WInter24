import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class SQLHelper {
// create the database
// create the tabels
// insert new meal
// get all meals

  static Future<Database> dataBase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'fav_meals.db'),
        onCreate: (db, version) {
      return db.execute(
          'create table meals (id TEXT PRIMARY KEY, title TEXT, image TEXT, duration INTEGER )');
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await SQLHelper.dataBase();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table,
      {required String where, required List<String> whereArgs}) async {
    final db = await SQLHelper.dataBase();
    return db.query(table); // select * from meals
  }
}
