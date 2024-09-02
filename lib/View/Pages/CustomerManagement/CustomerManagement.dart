import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/Mobile.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/SizeApp.dart';

class CustomerManagement extends StatelessWidget {
  const CustomerManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerAllApp(),
        appBar: AppBar(
          title: const TabBar(
            tabs: [
              Tab(
                text: "Customer",
                icon: Icon(Icons.person),
              ),
              Tab(
                text: "Add Customer",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CustomersView(),
            const Center(
              child: Text('ahmed'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomersView extends StatelessWidget {
  CustomersView({super.key});
  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            color: ColorUsed.whitesoft,
            height: context.getHeight(77),
            width: context.getWidth(100),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CardViewCustomers();
                }),
          ),
        )
      ],
    );
  }
}

class CardViewCustomers extends StatelessWidget {
  const CardViewCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.all(5),
        color: ColorUsed.whitesoft,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('name'),
              Divider(),
              Text('number'),
              Text('Title'),
            ],
          ),
        ));
  }
}
