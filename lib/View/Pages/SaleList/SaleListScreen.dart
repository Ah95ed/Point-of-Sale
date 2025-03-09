import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/Colors/Colors.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class InventoryItem {
  final int id;
  final String description;
  final int quantity;
  final String warehouse;
  final double unitPrice;
  final double totalPrice;
  final String barcode;

  InventoryItem({
    required this.id,
    required this.description,
    required this.quantity,
    required this.warehouse,
    required this.unitPrice,
    required this.totalPrice,
    required this.barcode,
  });
}

class SaleListScreen extends StatefulWidget {
  @override
  _SaleListScreenState createState() => _SaleListScreenState();
}

class _SaleListScreenState extends State<SaleListScreen> {
  final List<InventoryItem> items = [
    InventoryItem(
      id: 1,
      description: 'حمالة شاشة RB-412 26-65',
      quantity: 1,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 27000,
      totalPrice: 27000,
      barcode: '',
    ),
    InventoryItem(
      id: 2,
      description: 'BNC فصل كيبل',
      quantity: 16,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 250,
      totalPrice: 4000,
      barcode: '',
    ),
    InventoryItem(
      id: 3,
      description: 'BNC NEXXT',
      quantity: 100,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 200,
      totalPrice: 20000,
      barcode: '',
    ),
    InventoryItem(
      id: 4,
      description: 'كابل hd 4k نوع ديامود 1.5m',
      quantity: 1,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 4000,
      totalPrice: 4000,
      barcode: '',
    ),

    InventoryItem(
      id: 6,
      description: 'محول TOTO 10A',
      quantity: 2,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 13000,
      totalPrice: 26000,
      barcode: '',
    ),
    InventoryItem(
      id: 7,
      description: 'HFW1209CP-A-LED',
      quantity: 8,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 23000,
      totalPrice: 184000,
      barcode: '69231725382B4',
    ),
    InventoryItem(
      id: 8,
      description: 'WD 1TB HARD الاصلي',
      quantity: 1,
      warehouse: 'المخزن الرئيسي',
      unitPrice: 40000,
      totalPrice: 40000,
      barcode: '342243423',
    ),
  ];

  double getTotalAmount() {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.getHeight(50),
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(
              // horizontal: context.getWidth(4),
              vertical: context.getHeight(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'الحساب: ',
                      style: TextStyle(fontSize: context.getFontSize(8)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'العنوان: ',
                      style: TextStyle(fontSize: context.getFontSize(8)),
                    ),
                    Text(''),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'المخزن: ',
                      style: TextStyle(fontSize: context.getFontSize(8)),
                    ),
                    Text('المخزن الرئيسي'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'التاريخ: ',
                      style: TextStyle(fontSize: context.getFontSize(8)),
                    ),
                    Text('2025-01-02'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'رقم الفاتورة: ',
                      style: TextStyle(fontSize: context.getFontSize(8)),
                    ),
                    Text('62232'),
                  ],
                ),
              ],
            ),
          ),

          // Input Fields Section
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.teal[100],
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'المادة',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'العدد',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'سعر البيع',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'المجموع',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      enabled: false,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    'العملة: دينار',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: const Text(
                    'نوع السعر: بيع',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Table Header
          Container(
            color: Colors.grey[300],
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    '#',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'المادة',
                    textAlign: TextAlign.right,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'العدد',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'المخزن',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'سعر البيع',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'المجموع',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'الباركود',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Table Content
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final color =
                    index % 2 == 0 ? Colors.indigo[900] : Colors.grey[100];
                final textColor = index % 2 == 0 ? Colors.white : Colors.black;

                return Container(
                  color: color,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.id.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          item.description,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          item.quantity.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.warehouse,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'د.ع ${item.unitPrice.toStringAsFixed(0)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'د.ع ${item.totalPrice.toStringAsFixed(0)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.barcode,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: textColor),
                        ),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 8,
                  ),
                );
              },
            ),
          ),

          // Footer Section
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'نوع الخصم: مقطوعة',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'الخصم: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(border: Border.all()),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'الباقي: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Text('0', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'الرصيد السابق: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 80,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Text('0', textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'الرصيد الحالي: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 120,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(border: Border.all()),
                          child: const Text(
                            '0 دائن/مدين',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'الواصل: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(border: Border.all()),
                          child: Text(
                            'د.ع ${getTotalAmount().toStringAsFixed(0)}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: Colors.teal[100],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'المجموع بعد الخصم',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${getTotalAmount().toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 200,
                      color: Colors.grey[200],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'مجموع الفاتورة',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${getTotalAmount().toStringAsFixed(0)}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        const Text('طباعة'),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('تجديد'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigo[900],
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('حفظ'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                        ),
                        const SizedBox(width: 5),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('حذف'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
