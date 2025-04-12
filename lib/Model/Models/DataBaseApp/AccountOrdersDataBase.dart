import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class AccountOrdersDataBase {
  static const TableAccount = 'Account';
  static const TableResultSell = 'Result';
  static const version = 1;
  static const id = 'ID';
  static const id_customer = 'ID_Customer';
  static const name = 'Name';
  static const codeItem = 'Code';
  static const sale = 'Sale';
  static const buy = 'Buy';
  static const quantity = 'Quantity';
  static const ResultSell = 'ResultSell';

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await DataBaseSqflite.databasesq;
    return _database!;
  }

  Future<int> insertInAccount(Map<String, dynamic> data) async {
    _database = await database;
    return _database!.insert(
      TableAccount,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>?>> getAllResult() async {
    _database = await database;
    return await _database!.query(TableResultSell);
  }

  Future<Future<int>?> deleteResult() async {
    _database = await database;
    return _database!.delete(TableResultSell);
  }

  Future<List<Map<String, dynamic>>> getAllItems() async {
    _database = await database;
    return await _database!.query(TableAccount);
  }
 Future<List<Map<String, dynamic>>> getDataCustomers (String id_cus) async {
    _database = await database;
    final List<Map<String, dynamic>> results = await _database!.query(
      DataBaseSqflite.TableAccount,
      where: '$id_customer LIKE ?',
      whereArgs: ['%$id_cus%'],
    );
    return results;
  }


  Future<List<Map<String, dynamic>>> getDataSale() async {
    _database = await database;
    return await _database!.query(TableAccount, columns: [sale]);
}
  Future<List<Map<String, dynamic>?>> getAllDataFromAccount() async {
    _database = await database;
    return await _database!.query(TableAccount);
  }

  Future<Future<int>?> deleteAccount() async {
    _database = await database;
    return _database!.delete(TableAccount);
  }

  Future<List<Map<String, dynamic>>> getColumnData(String columnName) async {
    _database = await database;
    return await _database!.query(TableAccount, columns: [sale]);
  }

  Future<List<Map<String, dynamic>>> searchBarCodeOrder(
    String barCode,
  ) async {
    _database = await database;
    final List<Map<String, dynamic>> results = await _database!.query(
      DataBaseSqflite.TableName,
      where: '$codeItem LIKE ?',
      whereArgs: ['%$barCode%'],
    );
    return results;
  }

  Future<Future<int>?> delete(String id) async {
    _database = await database;
    return _database!.rawDelete(
      'DELETE FROM $TableAccount WHERE ID = ?',
      [id],
    );
  }
  Future<void> updateAccount(Map<String, dynamic> data) async {
    _database = await database;
    await _database!.update(
      TableAccount,
      data,
      where: '$id = ?',
      whereArgs: [data[id]],
    );
  }
}
