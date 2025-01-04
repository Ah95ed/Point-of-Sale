import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/CustomerController/CustomerController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/CustomerManagement/AddCustomer.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class CustomerManagement extends StatelessWidget {
  CustomerManagement({super.key});
  var controller = Get.lazyPut(() => Customercontroller());

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
  void initState() {
    _search = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Customercontroller>(
      init: Customercontroller(),
      builder: (c) {
        return Padding(
          padding: EdgeInsets.all(context.getMinSize(4)),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  c.searchCustomer(value);
                },
                controller: _search,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Language.search.tr,
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorUsed.appBarColor,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorUsed.appBarColor,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: ColorUsed.appBarColor,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: DeviceUtils.valueDecider(
                      context,
                      onMobile: 1,
                      onTablet: 3,
                      onDesktop: 4,
                      others: 2,
                    ),
                    childAspectRatio: 3.5,
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
                        child: Padding(
                          padding: EdgeInsets.all(context.getMinSize(6)),
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
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
