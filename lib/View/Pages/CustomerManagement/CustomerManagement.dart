import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/CustomerController/CustomerController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';

class CustomerManagement extends StatelessWidget {
  CustomerManagement({super.key});
  var controller = Get.lazyPut(() => Customercontroller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              // Tab(
              //   text: Language.addCustomers.tr,
              //   icon: const Icon(Icons.person_add),
              // ),
              Tab(text: "Customer".tr, icon: const Icon(Icons.person)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // const AddCustomer(),
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
  TextEditingController _search = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _address = TextEditingController();

  @override
  void initState() {
    // final c = Get.find<Customercontroller>();
    // c.getCustomer();
    super.initState();
  }

  @override
  void dispose() {
    _search.dispose();
    _name.dispose();
    _phone.dispose();
    _address.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Customercontroller>(
      init: Customercontroller(),
      builder: (cb) {
        // logInfo("message ${context.getFontSize(12)}");
        return Padding(
          padding: EdgeInsets.all(context.getMinSize(5)),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  cb.searchCustomer(value);
                },
                controller: _search,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: Language.search.tr,
                  prefixIcon: Icon(Icons.search, color: ColorUsed.appBarColor),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorUsed.appBarColor),
                  ),
                  labelStyle: TextStyle(color: ColorUsed.appBarColor),
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
                    childAspectRatio: 2.4,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: cb.customers.length,
                  itemBuilder: (context, index) {
                    return SizeBuilder(
                      width: context.scaleWidth,
                      height: context.scaleHeight,
                      baseSize: const Size(250, 180),
                      child: Builder(
                        builder: (context) {
                          return Card(
                            elevation: 4,
                            // margin: const EdgeInsets.all(5),
                            color: ColorUsed.whitesoft,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: context.getHeight(1),
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Text(cb.customers[index].name!),
                                      const Divider(),
                                      Text(cb.customers[index].phone!),
                                      const Divider(),
                                      Text(cb.customers[index].address!),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: IconButton(
                                    onPressed: () async {
                                      _name.text = cb.customers[index].name!;
                                      _phone.text = cb.customers[index].phone!;
                                      _address.text =
                                          cb.customers[index].address!;
                                      showDialog(
                                        context: context,
                                        builder: (c) {
                                          return AlertDialog(
                                            title: const Text("Select Action"),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await cb
                                                      .deleteCustomer(
                                                        int.parse(
                                                          cb
                                                              .customers[index]
                                                              .id!,
                                                        ),
                                                      )
                                                      .then((value) {
                                                        cb.customers.clear();
                                                        cb.getCustomer();
                                                      });
                                                  Navigator.pop(c);
                                                },
                                                child:  Text(Language.delete.tr),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                          'Edit Customer',
                                                        ),
                                                        content: Column(
                                                          children: [
                                                            TextField(
                                                              controller: _name,
                                                              decoration:
                                                                  const InputDecoration(
                                                                    hintText:
                                                                        'Enter new name',
                                                                  ),
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  _phone,
                                                              decoration:
                                                                  const InputDecoration(
                                                                    hintText:
                                                                        'Enter new phone',
                                                                  ),
                                                            ),
                                                            TextField(
                                                              controller:
                                                                  _address,
                                                              decoration:
                                                                  const InputDecoration(
                                                                    hintText:
                                                                        'Enter new address',
                                                                  ),
                                                            ),
                                                          ],
                                                        ),

                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                ctx,
                                                              );
                                                            },
                                                            child: const Text(
                                                              'Cancel',
                                                            ),
                                                          ),
                                                          TextButton(
                                                            onPressed: () async {
                                                              await cb.updateCustomer({
                                                                CustomersDatabase
                                                                        .name:
                                                                    _name.text,
                                                                CustomersDatabase
                                                                        .phone:
                                                                    _phone.text,
                                                                CustomersDatabase
                                                                        .address:
                                                                    _address
                                                                        .text,
                                                                CustomersDatabase
                                                                    .id: cb
                                                                        .customers[index]
                                                                        .id,
                                                              });
                                                              Navigator.pop(
                                                                ctx,
                                                              );
                                                            },
                                                            child: const Text(
                                                              'Save',
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Text('edit'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(c);
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.more_horiz),
                                  ),
                                  // child: IconButton(
                                  //   onPressed: () async {
                                  //     logInfo("message ${cb.customers[index].id}");
                                  //     await cb.delete(
                                  //       int.parse(cb.customers[index].id!),
                                  //     );
                                  //   },
                                  //   icon: const Icon(Icons.delete),
                                  // ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
