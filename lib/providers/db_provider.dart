import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:santaclara/providers/model/MyQRModel.dart';
export 'package:santaclara/providers/model/MyQRModel.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._(); //constructor privado

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'SantaClaraDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE bookings ('
          ' id INTEGER PRIMARY KEY,'
          ' imgqr TEXT'
          ' booking_id TEXT'
          ' info_booking TEXT'
          ' number_booking INTEGER'
          ' datebooking TEXT'
          ' player INTEGER'
          ')');
    });
  }

  //CREAR REGISTRO
  newBookingRaw() async {
    final db = await database;

    final res = await db
        .rawInsert("INSERT INTO bookings (id, imgqr, booking_id, info_booking) "
            "VALUES ");

    return res;
  }

  newBooking(MyQRModel newMyQRModel) async {
    final db = await database;
    final res = await db.insert('bookings', newMyQRModel.toJson());
    return res;
  }

  Future<MyQRModel> getMyQRId(int id) async {
    final db = await database;
    final res = await db.query('bookings', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? MyQRModel.fromJson(res.first) : null;
  }

  Future<List<MyQRModel>> getAllMyQR() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM bookings ORDER BY id DESC");

    List<MyQRModel> list =
        res.isNotEmpty ? res.map((c) => MyQRModel.fromJson(c)).toList() : [];
    return list;
  }
}
