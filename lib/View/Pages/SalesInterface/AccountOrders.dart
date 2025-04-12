import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sell/Control/AccountController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Helper/Log/LogApp.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/AccountOrdersDataBase.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/CustomersDataBase.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/AllItems.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeBuilder.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class AccountOrders extends StatefulWidget {
  const AccountOrders({super.key});

  @override
  State<AccountOrders> createState() => _AccountOrdersState();
}

class _AccountOrdersState extends State<AccountOrders> {
  TextEditingController _name = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _accont = TextEditingController();
  TextEditingController _numberList = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _typePrice = TextEditingController();
  TextEditingController _storage = TextEditingController();
  TextEditingController _search = TextEditingController();
  late String optionText, id_customer;
  @override
  void dispose() {
    _name = TextEditingController();
    _name.dispose();
    _accont.dispose();
    _numberList.dispose();
    _title.dispose();
    _phone.dispose();
    _date.dispose();
    _typePrice.dispose();
    _storage.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    id_customer = '';
    return GetBuilder<AccountController>(
      init: AccountController(),
      builder: (controller) {
        return Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(context.getMinSize(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _accont,
                            decoration: const InputDecoration(
                              labelText: 'الحساب',
                              prefixIcon: Icon(Icons.account_balance),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _title,
                            decoration: const InputDecoration(
                              labelText: 'العنوان',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Autocomplete<Map<String, dynamic>>(
                            // تحويل الخريطة إلى نص للعرض داخل القائمة
                            displayStringForOption:
                                (Map<String, dynamic> option) =>
                                    option["Name"] ?? "",
                            optionsBuilder: (
                              TextEditingValue textEditingValue,
                            ) {
                              if (textEditingValue.text.isEmpty) {
                                return const Iterable<
                                  Map<String, dynamic>
                                >.empty();
                              }
                              // logError("message ${controller.items}");
                              // فلترة القائمة بناءً على قيمة المفتاح "name"
                              return controller.items
                                  .whereType<Map<String, dynamic>>()
                                  .where((Map<String, dynamic> option) {
                                    optionText = option["Name"].toString();
                                    logError(" ====== ${option}");
                                    return optionText.toLowerCase().contains(
                                      textEditingValue.text.toLowerCase(),
                                    );
                                  });
                            },
                            fieldViewBuilder: (
                              BuildContext context,
                              TextEditingController textEditingController,
                              FocusNode focusNode,
                              VoidCallback onFieldSubmitted,
                            ) {
                              this._name = textEditingController;
                              return TextField(
                                controller: _name,
                                focusNode: focusNode,
                                decoration: const InputDecoration(
                                  hintText:
                                      'أدخل الاسم هنا', // التلميح داخل حقل النص
                                ),
                              );
                            },

                            onSelected: (Map<String, dynamic> selection) {
                              _phone.text = selection["Phone"].toString();
                              _title.text = selection["Address"].toString();
                              id_customer = selection["ID"].toString();
                              controller.getDataCustomers(id_customer);
                              //!    aaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                              controller.update();
                            },
                          ),
                        ),
                      ],
                    ),

                    Row(
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _date,
                            decoration: const InputDecoration(
                              labelText: 'التاريخ',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _phone,
                            decoration: const InputDecoration(
                              labelText: 'الهاتف',
                              prefixIcon: Icon(Icons.phone),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _numberList,
                            decoration: const InputDecoration(
                              labelText: 'رقم الفاتورة',
                              prefixIcon: Icon(Icons.receipt_long),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      spacing: context.getHeight(10),
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _storage,
                            decoration: const InputDecoration(
                              labelText: 'المستودع',
                              prefixIcon: Icon(Icons.warehouse),
                            ),
                          ),
                        ),

                        Expanded(
                          child: TextFormField(
                            controller: _typePrice,
                            decoration: const InputDecoration(
                              labelText: 'نوع السعر',
                              prefixIcon: Icon(Icons.attach_money),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: context.getHeight(34),
              child: Padding(
                padding: EdgeInsets.all(context.getMinSize(4)),
                child: TextFormField(
                  onChanged: (value) async {
                    if (value.isEmpty) return;
                    if (controller.items.isEmpty ||
                        _name.text.isEmpty ||
                        id_customer.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            title: const Text("No Customer Found !! "),
                            content: const Text("Please Select Customer First"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(ctx),
                                child: const Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                      _search.clear();
                      return;
                    }
                    await controller.searchCodeOrder(value, id_customer);
                    _search.clear();
                  },
                  controller: _search,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Search'.tr,
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: context.getFontSize(12),
                    ),
                    suffixIcon:
                        DeviceUtils.isMobile(context)
                            ? IconButton(
                              onPressed: () async {
                                final perm = await Permission.camera.request();
                                if (await perm.isGranted) {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: context.screenWidth,
                                          height: context.screenHeight / 2,
                                          child: SimpleBarcodeScanner(
                                            scaleHeight: context.screenHeight,
                                            scaleWidth:
                                                context.screenHeight / 1.2,
                                            onScanned: (code) {
                                              setState(() {
                                                _search.text = code;
                                              });
                                            },
                                            continuous: true,
                                            onBarcodeViewCreated: (
                                              BarcodeViewController c,
                                            ) {
                                              // this.controller = controller;
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.qr_code_scanner_rounded,
                                color: Colors.black,
                              ),
                            )
                            : null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white38,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: DeviceUtils.isMobile(context) ? 1 : 3,
                    childAspectRatio: context.getMinSize(1.6),
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: controller.search.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizeBuilder(
                      baseSize: const Size(250, 300),
                      height: context.getHeight(300),
                      width: context.getWidth(200),
                      child: Builder(
                        builder: (context) {
                          return AllItems(
                            () async {
                              showDialog(
                                context: context,
                                builder: (c) {
                                  return AlertDialog(
                                    title: const Text("Select "),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                        
                                          showEditDailog(context, {
                                            DataBaseSqflite.name:
                                                controller.search[index].name,
                                            DataBaseSqflite.sale:
                                                controller.search[index].sale,
                                            DataBaseSqflite.quantity:
                                                controller
                                                    .search[index]
                                                    .quantity,
                                            DataBaseSqflite.id:
                                                controller.search[index].id,
                                          }, controller);
                                        },
                                        child: const Text("Edit"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(c);
                                        },
                                        child: const Text("Delete"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(c);
                                        },
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            name: controller.search[index].name,
                            sale: controller.search[index].sale,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              color: ColorUsed.whiteBlue,
              height: context.getHeight(38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Result : ${controller.resultSell} ',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: context.getFontSize(12),
                    ),
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      controller.resultSell = 0.0;
                      controller.deleteShared();
                      controller.deleteAllAccount();
                    },
                    icon: const Icon(Icons.delete),
                    label: Text(Language.delete.tr),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      checkcustomer(controller, context);
                    },
                    icon: const Icon(Icons.save),
                    label: Text(Language.save.tr),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      //print
                      controller.printOrder();
                    },
                    icon: const Icon(Icons.print, color: Colors.black54),
                    label: const Text(
                      'طباعة',
                      style: TextStyle(color: Colors.black54),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void checkcustomer(AccountController c, BuildContext context) async {
    for (var element in c.items) {
      if (element!['Name'] == _name.text) {
        id_customer = element['ID'];
        return;
      }
    }

    showDailogToAdd(context, c);
    return;
  }

  void showEditDailog(
    BuildContext ctx,
    Map<String, dynamic> data,
    AccountController c,
  ) {
    TextEditingController _name = TextEditingController(
      text: data[AccountOrdersDataBase.name],
    );
    TextEditingController _sale = TextEditingController(
      text: data[AccountOrdersDataBase.sale],
    );
    TextEditingController _quantity = TextEditingController(
      text: data[AccountOrdersDataBase.quantity],
    );

    showDialog(
      context: ctx,

      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Customer'),
          content: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: _sale,
                decoration: const InputDecoration(labelText: 'Sale'),
              ),

              TextFormField(
                controller: _quantity,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
            ],
          ),

          actions: [
            TextButton(
              child: const Text('نعم'),
              onPressed: () {
                c.updateAccount({
                  AccountOrdersDataBase.name: _name.text,
                  AccountOrdersDataBase.sale: _sale.text,
                  AccountOrdersDataBase.quantity: _quantity.text,
                  AccountOrdersDataBase.id: data[AccountOrdersDataBase.id],
                });
                c.search.clear();

                _name.dispose();
                _sale.dispose();
                _quantity.dispose();
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('لا'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                // _name.clear();
                // _sale.clear();
                // _quantity.clear();

                _name.dispose();
                _sale.dispose();
                _quantity.dispose();
              },
            ),
          ],
        );
      },
    );
  }

  void showDailogToAdd(BuildContext cx, AccountController c) {
    showDialog(
      context: cx,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Customer'),
          content: const Text("هل تريد اضافة العميل"),
          actions: [
            TextButton(
              child: const Text('نعم'),
              onPressed: () async {
                await c.insertCustomer({
                  CustomersDatabase.name: _name.text,
                  CustomersDatabase.phone: _phone.text,
                  CustomersDatabase.address: _title.text,
                });

                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('لا'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
