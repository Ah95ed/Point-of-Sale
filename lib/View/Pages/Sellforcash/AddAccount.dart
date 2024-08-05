import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class AddAccount extends StatelessWidget {
  AddAccount({super.key});
  TextEditingController? cc = TextEditingController();
  double? h;
  double? w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height / 4;
    w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const TabBar(
          tabs: [
            Tab(
              text: "Ahmed",
            ),
            Tab(
              text: "Ali",
            ),
            Tab(
              text: "Adam",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  color: ColorUsed.whitesoft,
                  height: h,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldCustom(
                              name: 'name_account'.tr,
                            ),
                          ),
                          Expanded(
                            child: TextFieldCustom(
                              name: 'title_account'.tr,
                            ),
                          ),
                          Expanded(
                            child: TextFieldCustom(
                              name: 'Number Account',
                            ),
                          ),
                          Expanded(
                            child: TextFieldCustom(
                              name: 'Email Account',
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 3,
                              child: TextFieldCustom(
                                name: 'type_account'.tr,
                              ),
                            ),
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 3,
                              child: TextFieldCustom(
                                name: "number document",
                              ),
                            ),
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 3,
                              child: TextFieldCustom(
                                icons: Icons.discount,
                                name: "Discount Percentage",
                                input: TextInputType.number,
                              ),
                            ),
                            Expanded(
                              // width: MediaQuery.of(context).size.width / 3,
                              child: OutlinedButton(
                                onPressed: () {
                                  final snackBar = SnackBar(
                                    content:
                                        const Text('This is a SnackBar!'),
                                    action: SnackBarAction(
                                      label: 'Undo',
                                      onPressed: () {
                                        // Some code to undo the change.
                                        print('Undo action pressed');
                                      },
                                    ),
                                  );
    
                                  // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                style: const ButtonStyle(
                                  elevation: WidgetStatePropertyAll(8),
                                ),
                                child: const Row(
                                  children: [
                                    Text('Save'),
                                    Spacer(),
                                    Icon(Icons.save),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Table(
                    border: TableBorder.all(color: Colors.white, width: 2.0),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: ColorUsed.lightBlue,
                        ),
                        children: const [
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Number',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'description',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                          // Spacer(),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Edition',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        4,
                        (i) {
                          return TableRow(
                            children: [
                              const TableCell(
                                verticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Ahmed shaker muhmood '),
                                ),
                              ),
                              const TableCell(
                                child: Text('Ahmed'),
                              ),
                              const TableCell(
                                child: Text('Ahmed'),
                              ),
                              TableCell(
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const AlertDialog(
                                          title: Text(
                                              'Here to edit data from the table (^_^) '),
                                        );
                                      },
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Text('Edit Here'),
                                      Spacer(),
                                      Icon(Icons.edit)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(
              child: Text('Ali '),
            ),
            const Center(
              child: Text('Adam'),
            ),
          ],
        ),
      ),
    );
  }
}
