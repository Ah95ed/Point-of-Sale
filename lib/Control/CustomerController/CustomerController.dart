import 'package:get/get.dart';

import 'package:point_of_sell/Model/CustomersModels/CustomerModel.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';

class Customercontroller extends GetxController {
  late CustomerModel model;
  List<CustomerModel> customers = [];
  @override
  void onInit() async {
    super.onInit();
    model = CustomerModel();
    await getCustomer();
  }

  Future<void> getCustomer() async {
    var list = await model.getCustomer();
    customers =
        list
            .map(
              (item) => CustomerModel(
                name: item![CustomersDatabase.name],
                phone: item[CustomersDatabase.phone],
                address: item[CustomersDatabase.address],
                id: item[CustomersDatabase.id].toString(),
              ),
            )
            .toList();

    update();
  }

  Future<void> delete(int id) async {
    customers.clear();
    await model.deleteCustomer(id);

    update();
  }

  Future<void> updateCustomer(Map<String, dynamic> data) async {
    await model.updateCustomer(data);
    if (await model.result > 0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "data updated successfully",
          duration: Duration(seconds: 2),
        ),
      );
      model.result = 0;
     await getCustomer();
      return;
    }
    Get.showSnackbar(
      const GetSnackBar(
        message: "something went wrong",
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> insert(Map<String, String> data) async {
    await model.insertCustomers(data);
    if (await model.result > 0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "data inserted successfully",
          duration: Duration(seconds: 2),
        ),
      );
      update();
      return;
    }
    Get.showSnackbar(
      const GetSnackBar(
        message: "something went wrong",
        duration: Duration(seconds: 2),
      ),
    );
  }
  Future<void> deleteCustomer(int i) async {
    await model.deleteCustomer(i);
   
  }

  List<Map<String, dynamic>> search = [];
  Future<void> searchCustomer(String name) async {
    search = await model.searchCustomer(name);
    if (search.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "No data found",
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    customers.clear();
    customers =
        search
            .map(
              (item) => CustomerModel(
                name: item[CustomersDatabase.name],
                phone: item[CustomersDatabase.phone],
                address: item[CustomersDatabase.address],
              ),
            )
            .toList();
    update();
  }
}
