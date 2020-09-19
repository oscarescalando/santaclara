import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._(); //constructor privado

  DBProvider._();

  Future<Database> get _database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }
}
