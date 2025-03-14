import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SaleListDataBase {

  static const tableSaleList = 'SaleList';
  static const version = 1;
   
    static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await DataBaseSqflite.databasesq;
    return _database!;
  }
}