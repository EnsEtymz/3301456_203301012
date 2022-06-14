import 'dart:io';

import 'package:marketim/veritabani/kayitlar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class kayitlarservice {
  static kayitlarservice instance = kayitlarservice.internal();
  kayitlarservice.internal();
  factory kayitlarservice() {
    return instance;
  }

  Future<List<kayitlar>> getAll() async {
    final mapList = await getkayitmaps();
    List<kayitlar> kayitlist = [];
    mapList.forEach((element) {
      kayitlist.add(kayitlar.fromMap(element));
    });
    return kayitlist;
  }

  Future<List<Map<String, dynamic>>> getkayitmaps() async {
    Database? db = await this.db;
    return await db!.query("kayitlarr");
  }

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}kayitlar.db";
    final kayitlarDb = await openDatabase(path, version: 1, onCreate: createDb);
    return kayitlarDb;
  }

  void createDb(Database db, int version) async {
    await db.execute("CREATE TABLE kayitlarr(text TEXT PRIMARY KEY )");
  }

  Future<int> addkayit(kayitlar kayit) async {
    Database? db = await this.db;
    return await db!.insert("kayitlarr", kayit.toMap());
  }
}
