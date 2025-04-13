// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';

class CustomerModel {
  String? name, phone, address,id;
  late CustomersDatabase _database;

  CustomerModel({this.name, this.phone, this.address,this.id}) {
    _database = CustomersDatabase();
  }
Future<void> deleteCustomer ( int i) async {
  await _database.deleteCustomer(i) ;
  }

  Future<List<Map<String, dynamic>?>> getCustomer() async {
    return await _database.getAllCustomrers();
  }

  late int result;
  Future<void> insertCustomers(Map<String, String> data) async {
    result = await _database.insertCustomers(data);
  }
  Future<void> updateCustomer (Map<String , dynamic> data) async {
    result = await _database.updateCustomer(data);
  }
  Future<List<Map<String, dynamic>>> searchCustomer(String name) async {
   return _database.searchCustomer(name);
  }
}
