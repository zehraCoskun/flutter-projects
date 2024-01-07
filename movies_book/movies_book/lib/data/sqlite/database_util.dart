import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUtil {
  static const String databaseName = "moviesbook.db";
  static Future<Database> databaseAccess() async {
    String databasePath = join(await getDatabasesPath(), databaseName);
    // if (await databaseExists(databasePath)) {
    //   print("veri tabanı mevcut, kopyalamaya gerek yok");
    // } else {
    ByteData data = await rootBundle.load("database/$databaseName");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(databasePath).writeAsBytes(bytes, flush: true);
    print("veri tabanı kopyalandı");
    // }
    return openDatabase(databasePath);
  }
}
