import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Widget/ShareWidget/TextCustom.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class ChatGPT extends StatelessWidget {
  const ChatGPT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سند قبض'),
      ),
      body: ReceiptForm(),
    );
  }
}

class ReceiptForm extends StatelessWidget {
  ReceiptForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final String _currency = 'دولار';
  final String _accountName = 'اسم الحساب';
  final String _box = 'صندوق 188';
  final TextEditingController _documentnumber = TextEditingController();
  final TextEditingController _exchangeRateController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _amountInWordsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(context.getMinSize(6)),
        child: SizedBox(
          height: context.screenHeight,
          child: Column(
            spacing: context.getMinSize(6),
            children: [
              Row(
                children: [
                   SizedBox(
                  width: context.screenWidth /3.6,
                    child: Text("documentnumber".tr),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _documentnumber,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        // suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ],
              ),
             
              
              const Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('التاريخ:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('العملة:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: DropdownButtonFormField<String>(
                      value: _currency,
                      onChanged: (value) {
                        // setState(() {
                        //   _currency = value!;
                        // });
                      },
                      items: ['دولار', 'يورو', 'دينار']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('سعر الصرف:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _exchangeRateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('اسم الحساب:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: DropdownButtonFormField<String>(
                      value: _accountName,
                      onChanged: (value) {
                        // setState(() {
                        //   _accountName = value!;
                        // });
                      },
                      items: ['اسم الحساب']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('الصندوق:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: DropdownButtonFormField<String>(
                      value: _box,
                      onChanged: (value) {
                        // setState(() {
                        //   _box = value!;
                        // });
                      },
                      items: ['صندوق 188']
                          .map((label) => DropdownMenuItem(
                                value: label,
                                child: Text(label),
                              ))
                          .toList(),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('المبلغ:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _amountController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('الخصم:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _discountController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Text('المبلغ كتابة:'),
                  ),
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _amountInWordsController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle print action
                    },
                    child: const Text('طباعة'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle save action
                    },
                    child: const Text('حفظ'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle new receipt action
                    },
                    child: const Text('سند جديد'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle previous receipts action
                    },
                    child: const Text('السندات السابقة'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RowInPayCash extends StatelessWidget {
  RowInPayCash({
    super.key,
    required this.title,
    required this.text,
  });
  TextEditingController? text;
  String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextCustom(
            text: title!,
          ),
        ),
        Expanded(
          flex: 4,
          child: TextFieldCustom(
            text: text,
            icons: Icons.document_scanner,
            name: title!,
            input: TextInputType.text,
          ),
        ),
      ],
    );
  }
}
