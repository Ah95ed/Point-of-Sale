import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Control/CustomerController/CustomerController.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/DeviceUtils.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class CustomerManagement extends StatelessWidget {
  const CustomerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: GetBuilder<Customercontroller>(
          init: Customercontroller(),
          builder: (controller) {
            controller.getCustomer();
            return Scaffold(
              drawer: DeviceUtils.isMobile(context) ? const DrawerAllApp() : null,
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
                  
                  // const AddCustomer(),
                  CustomersView(controller),
                ],
              ),
            );
          }),
    );
  }
}

class CustomersView extends StatelessWidget {
  CustomersView(this.c,{super.key});
  final TextEditingController _search = TextEditingController();
 final  Customercontroller c ;

  @override
  Widget build(BuildContext context) {
    // c.getCustomer();
    return Column(
      children: [
        TextFieldCustom(
          name: 'name'.tr,
          icons: Icons.search,
          text: _search,
          input: TextInputType.text,
        ),
        Expanded(
          child: Container(
            color: ColorUsed.whiteBlue,
            height: context.getHeight(77),
            width: context.getWidth(100),
            child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: DeviceUtils.isMobile(context) ? 1 : 3,
                childAspectRatio: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: c.customers!.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 4,
                    margin: const EdgeInsets.all(5),
                    color: ColorUsed.whitesoft,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        context.getFontSize(2),
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
                      ),
                    ));
              },
            ),
          ),
        )
      ],
    );
  }
}
