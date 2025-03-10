import 'package:flutter/material.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية للعرض في الجدول (UI فقط)
    final List<Map<String, dynamic>> items = [
      {
        'item': 'RB-4.12-26.5 عدسة نظارة',
        'quantity': 1,
        'price': 270.0,
        'total': 270.0,
      },
      {'item': 'BNC NEXT', 'quantity': 16, 'price': 1.2, 'total': 19.2},
      {
        'item': 'HP PRINTER 4 INK',
        'quantity': 10,
        'price': 20.0,
        'total': 200.0,
      },
      {'item': '1.5m HDMI CABLE', 'quantity': 5, 'price': 15.0, 'total': 75.0},
      {
        'item': 'HP1200 LASERJET',
        'quantity': 2,
        'price': 100.0,
        'total': 200.0,
      },
      {'item': 'HP19v POWER', 'quantity': 3, 'price': 35.0, 'total': 105.0},
      {'item': 'WD 1TB HARD', 'quantity': 1, 'price': 75.0, 'total': 75.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج فاتورة مبيعات'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1) قسم الحقول العلوية
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'الحساب',
                              prefixIcon: Icon(Icons.account_balance),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'العميل',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'التاريخ',
                              prefixIcon: Icon(Icons.date_range),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'رقم الفاتورة',
                              prefixIcon: Icon(Icons.receipt_long),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'المستودع',
                              prefixIcon: Icon(Icons.warehouse),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
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

            const SizedBox(height: 16.0),

            // 2) جدول الأصناف
            Container(
              height: context.screenWidth /1.3 ,
              width: context.screenHeight ,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('الصنف')),
                  DataColumn(label: Text('العدد')),
                  DataColumn(label: Text('سعر البيع')),
                  DataColumn(label: Text('المجموع')),
                ],
                rows:
                    items.map((item) {
                      return DataRow(
                        cells: [
                          DataCell(Text(item['item'].toString())),
                          DataCell(Text(item['quantity'].toString())),
                          DataCell(Text(item['price'].toString())),
                          DataCell(Text(item['total'].toString())),
                        ],
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 16.0),

            // 3) الإجماليات (الإجمالي - الخصم - الصافي)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildTotalRow(title: 'الإجمالي', value: '443.0'),
                    const SizedBox(height: 4.0),
                    _buildTotalRow(title: 'الخصم', value: '0.0'),
                    const SizedBox(height: 4.0),
                    _buildTotalRow(title: 'الصافي', value: '443.0'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16.0),

            // 4) الأزرار السفلية
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // منطق الحذف (UI فقط)
                  },
                  icon: const Icon(Icons.delete),
                  label: const Text('حذف'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton.icon(
                  onPressed: () {
                    // منطق الحفظ (UI فقط)
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('حفظ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // تابع مساعد لبناء صف عرض (العنوان - القيمة)
  Widget _buildTotalRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$title: $value',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
