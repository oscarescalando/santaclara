import 'dart:io';
import 'dart:convert';
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
    final path = join(documentsDirectory.path, 'stDB.db');

    print(path);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE bookings (id INTEGER PRIMARY KEY, imgqr TEXT, bookingid TEXT, infobooking TEXT, numberbooking INTEGER, datebooking TEXT, player INTEGER)');
    });
  }

  //CREAR REGISTRO
  newBookingRaw(MyQRModel myQr) async {
    final db = await database;

    String sql =
        'INSERT INTO bookings (id, imgqr, bookingid, infobooking, numberbooking, datebooking, player) VALUES (3, "data:image/png;base64,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", "170177", "Register", 1, "Thu, 01 Oct 2020", 4)';

    final res = await db.rawInsert(
        'INSERT INTO bookings (id, imgqr, bookingid, infobooking, numberbooking, datebooking, player) VALUES (${myQr.id}, "${myQr.imgqr}", "${myQr.bookingid}", "${myQr.infobooking}", ${myQr.numberbooking}, "${myQr.datebooking}", ${myQr.player})');

    //final res = await db.rawInsert(sql);
    /*
    final res = await db.rawInsert(
        "INSERT INTO bookings (id, imgqr, bookingid, infobooking, numberbooking, datebooking, player) VALUES (?, '?', '?', '?', ?, '?', ?)",
        [
          myQr.id,
          myQr.imgqr,
          myQr.bookingid,
          myQr.numberbooking,
          myQr.datebooking,
          myQr.player
        ]); */
    print('Result => ${res}');
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
