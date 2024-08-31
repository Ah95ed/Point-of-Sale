import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/HomeController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/Model/Models/DataBaseApp/DataBaseSqflite.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Pages/EditPage.dart';
import 'package:point_of_sell/View/Pages/SalesInterface/SalesInterface.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/Widget/SelectDate.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/CustomMaterialButton.dart';
import 'package:point_of_sell/View/Widget/storgeWidget/TableStoragr.dart';
import 'package:point_of_sell/View/Widget/storgeWidget/TabsOnStorage.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';
import '../../Widget/TextField.dart';

class TheStorePage extends StatefulWidget {
  const TheStorePage({super.key});

  @override
  State<TheStorePage> createState() => _TheStorePageState();
}

class _TheStorePageState extends State<TheStorePage> {
  TextEditingController name = TextEditingController();

  TextEditingController code = TextEditingController();

  TextEditingController sale = TextEditingController();

  TextEditingController buy = TextEditingController();

  TextEditingController quantity = TextEditingController();

  // Company
  TextEditingController company = TextEditingController();

  TextEditingController date = TextEditingController(
    text: (DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString()),
  );

  @override
  void dispose() {
    name.dispose();
    code.dispose();
    sale.dispose();
    buy.dispose();
    quantity.dispose();
    company.dispose();
    date.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      drawer: const DrawerAllApp(),
      appBar: AppBar(
        title: Text('The Store'.tr),
        centerTitle: true,
      ),
      // extendBodyBehindAppBar: true,

      // body: TableStoragr(),
      resizeToAvoidBottomInset: true,
      body: DefaultTabController(
          length: 2,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: [
                SizedBox(
                  height: context.getHeight(10),
                  child: TabBar(
                    tabs: [
                      Tab(icon: const Icon(Icons.add), text: Language.add.tr),
                      Tab(
                          icon: const Icon(Icons.person),
                          text: Language.edit.tr),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.isMobile
                      ? context.getHeight(90) -
                          context.getAppBarHeightWithStatusBar()
                      : context.getHeight(92),
                  child: TabBarView(
                    children: [
                      AddItems(
                          name: name,
                          code: code,
                          sale: sale,
                          buy: buy,
                          quantity: quantity,
                          company: company,
                          date: date),
                      const EditItem(),
                    ],
                  ),
                ),
              ],
            ),
          )),
      // body: AddItems(name: name, code: code, sale: sale, buy: buy, quantity: quantity, company: company, date: date),
    );
  }
}

class EditItem extends StatelessWidget {
  const EditItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldCustom(),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 1 : 2,
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return;
            },
          ),
        )
      ],
    );
  }
}

class AddItems extends StatelessWidget {
  const AddItems({
    super.key,
    required this.name,
    required this.code,
    required this.sale,
    required this.buy,
    required this.quantity,
    required this.company,
    required this.date,
  });

  final TextEditingController name;
  final TextEditingController code;
  final TextEditingController sale;
  final TextEditingController buy;
  final TextEditingController quantity;
  final TextEditingController company;
  final TextEditingController date;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return context.isMobile
            ? Column(
                children: [
                  TextFieldCustom(
                    name: 'itemName'.tr,
                    icons: Icons.shape_line,
                    text: name,
                  ),
                  TextFieldCustom(
                    name: 'code'.tr,
                    icons: Icons.barcode_reader,
                    text: code,
                  ),
                  TextFieldCustom(
                    name: "sale".tr,
                    icons: Icons.price_change,
                    text: sale,
                  ),
                  TextFieldCustom(
                    name: "buy".tr,
                    icons: Icons.description,
                    text: buy,
                  ),
                  TextFieldCustom(
                    name: 'quantity'.tr,
                    icons: Icons.description,
                    text: quantity,
                  ),
                  TextFieldCustom(
                    name: 'company_name'.tr,
                    icons: Icons.store_sharp,
                    text: company,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCustom(
                          name: "date".tr,
                          icons: Icons.date_range,
                          text: date,
                        ),
                      ),
                      SelectDate(dateCtrl: date),
                    ],
                  ),
                  CustomMaterialButton(
                    title: 'Add'.tr,
                    onPressed: () {
                      controller.addItems(
                        {
                          DataBaseSqflite.name: name.text,
                          DataBaseSqflite.codeItem: code.text,
                          DataBaseSqflite.sale: sale.text,
                          DataBaseSqflite.buy: buy.text,
                          DataBaseSqflite.quantity: quantity.text,
                          DataBaseSqflite.date: date.text,
                          DataBaseSqflite.company: company.text,
                        },
                      );
                      name.clear();
                      code.clear();
                      sale.clear();
                      buy.clear();
                      company.clear();
                      quantity.clear();
                      date.clear();

                      // controller.update();
                    },
                  ),
                ],
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCustom(
                          name: 'itemName'.tr,
                          icons: Icons.shape_line,
                          text: name,
                        ),
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          name: 'code'.tr,
                          icons: Icons.barcode_reader,
                          text: code,
                        ),
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          name: "sale".tr,
                          icons: Icons.price_change,
                          text: sale,
                        ),
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          name: "buy".tr,
                          icons: Icons.description,
                          text: buy,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldCustom(
                          name: 'quantity'.tr,
                          icons: Icons.description,
                          text: quantity,
                        ),
                      ),
                      Expanded(
                        child: TextFieldCustom(
                          name: 'company_name'.tr,
                          icons: Icons.store_sharp,
                          text: company,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFieldCustom(
                                name: "date".tr,
                                icons: Icons.date_range,
                                text: date,
                              ),
                            ),
                            SelectDate(dateCtrl: date),
                          ],
                        ),
                      ),
                      CustomMaterialButton(
                        title: 'Adders'.tr,
                        onPressed: () {
                          controller.addItems(
                            {
                              DataBaseSqflite.name: name.text,
                              DataBaseSqflite.codeItem: code.text,
                              DataBaseSqflite.sale: sale.text,
                              DataBaseSqflite.buy: buy.text,
                              DataBaseSqflite.quantity: quantity.text,
                              DataBaseSqflite.date: date.text,
                              DataBaseSqflite.company: company.text,
                            },
                          );
                          name.clear();
                          code.clear();
                          sale.clear();
                          buy.clear();
                          company.clear();
                          quantity.clear();
                          date.clear();

                          // controller.update();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: CardTableStorage(),
                  ),
                  // const Expanded(
                  //   flex: 2,
                  //   child: TabsOnStorage(),
                  // ),
                ],
              );
      },
    );
  }
}
