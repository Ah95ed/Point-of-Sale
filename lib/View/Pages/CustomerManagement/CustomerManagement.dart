import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/CustomerController/CustomerController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/CustomerManagement/AddCustomer.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';

class CustomerManagement extends StatelessWidget {
  const CustomerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(
                text: Language.addCustomers.tr,
                icon: const Icon(Icons.person_add),
              ),
              Tab(
                text: "Customer".tr,
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const AddCustomer(),
            CustomersView(),
          ],
        ),
      ),
    );
  }
}

class CustomersView extends StatefulWidget {
  CustomersView({super.key});

  @override
  State<CustomersView> createState() => _CustomersViewState();
}

class _CustomersViewState extends State<CustomersView> {
  late TextEditingController _search;
  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Customercontroller>(
      init: Customercontroller(),
      builder: (c) {
        return Column(
          children: [
            TextFieldCustom(
              name: 'name'.tr,
              icons: Icons.search,
              text: _search,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: DeviceUtils.valueDecider(
                    context,
                    onMobile: 2,
                    onTablet: 3,
                    onDesktop: 4,
                    others: 2,
                  ),
                  childAspectRatio: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                ),
                itemCount: c.customers!.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 4,
                      // margin: const EdgeInsets.all(5),
                      color: ColorUsed.whitesoft,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.customers![index].name!),
                          const Divider(),
                          Text(c.customers![index].phone!),
                          const Divider(),
                          Text(c.customers![index].address!),
                        ],
                      ));
                },
              ),
            )
          ],
        );
      },
    );
  }
}
