import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LiabilityDataBase {
  //! Liability table
  //Liability users
  static const TableLi_user = 'Li_users';
  static const TableLi_user_name = 'Li_users_name';
  //Liability

  static const TableLiability = 'Liability';
  static const user_name = 'user_name';
  static const user_id = 'user_id';
  static const item = 'item';
  static const li_quantity = 'li_quantity';
  static const prise = 'prise';
  static const li_date = 'li_date';

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await DataBaseSqflite.databasesq;
    return _database!;
  }

  //! Liabilities function table ---

  Future<void> insert_li(int userId, String item, String itemCount,
      String price, String date) async {
    Database? db = await database;
    await db.insert(
      TableLiability,
      {
        'user_id': userId,
        'item': item,
        'li_quantity': itemCount,
        'prise': price,
        'li_date': date,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateLiability(
      int id, String item, String itemCount, String price, String date) async {
    Database? db = await database;
    await db.update(
      TableLiability,
      {
        'item': item,
        'li_quantity': itemCount,
        'prise': price,
        'li_date': date,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateLiabilityuser(int id, String name) async {
    Database? db = await database;
    await db.update(
      TableLi_user,
      {
        TableLi_user_name: name,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, dynamic>>> getAllLiabilities() async {
    Database? db = await database;
    var result = await db.query(TableLiability);
    return result;
  }

  Future<Object?> getUserNameById(int id) async {
    Database? db = await database;
    var result = await db.query(TableLi_user, where: 'ID = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return result.first['Li_users_name'];
    } else {
      return '';
    }
  }

  Future<List<Map<String, dynamic>>> getCusLiabilities(int userId) async {
    Database? db = await database;
    var result = await db.query(
      TableLiability,
      where: 'user_id = ?',
      whereArgs: [userId],
    );
    return result;
  }

  Future<List<Map<String, dynamic>>> getLiabilitieWithID(int ID) async {
    Database? db = await database;
    var result = await db.query(
      TableLiability,
      where: 'ID = ?',
      whereArgs: [ID],
    );
    return result;
  }

  // user li
  Future<void> insert_li_user(
    String userName,
  ) async {
    Database? db = await database;
    await db.insert(
      TableLi_user,
      {
        'Li_users_name': userName,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllLiabilitiesuser() async {
    Database? db = await database;
    var result = await db.query(TableLi_user);
    return result;
  }

  Future<void> deleteLiRecordById(int id) async {
    Database? db = await database;
    await db.delete(TableLiability, where: 'ID = ?', whereArgs: [id]);
  }

  Future<void> deleteLiUsRecordById(int id) async {
    Database? db = await database;
    await db.delete(TableLi_user, where: 'ID = ?', whereArgs: [id]);
  }

  Future<int> getLIRecordCount() async {
    Database? db = await database;

    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT COUNT(*) AS count FROM $TableLi_user',
    );

    int count = result.first['count'] as int;
    return count;
  }
}
