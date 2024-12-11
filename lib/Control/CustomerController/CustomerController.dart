import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Log/Logger.dart';
import 'package:point_of_sell/Model/CustomersModels/CustomerModel.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';

class Customercontroller extends GetxController {
  late CustomerModel model;
  List<CustomerModel>? customers;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    model = CustomerModel();
    getCustomer();
    Log.log('init state');
  }

  Future<void> getCustomer() async {
    var list = await model.getCustomer();
    customers = list
        .map((item) => CustomerModel(
              name: item![CustomersDatabase.name],
              phone: item[CustomersDatabase.phone],
              address: item[CustomersDatabase.address],
            ))
        .toList();
    update();
  }

  Future<void> insert(Map<String, String> data) async {
    await model.insertCustomers(data);
    if (model.result > 0) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "data inserted successfully",
          duration: Duration(seconds: 1),
        ),
      );
      update();
      return;
    }
    Get.showSnackbar(
      const GetSnackBar(
        message: "something went wrong",
        duration: Duration(seconds: 1),
      ),
    );
  }
}
