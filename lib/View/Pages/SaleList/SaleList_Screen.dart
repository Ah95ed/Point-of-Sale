import 'package:flutter/material.dart';
import 'package:point_of_sell/Helper/Locale/Language.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('نموذج فاتورة مبيعات'),
       centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
              height: context.screenWidth / 1.3,
              width: context.screenHeight,
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
                rows: [
                  const DataRow(
                    cells: [
                      DataCell(Text('منتج 1')),
                      DataCell(Text('2')),
                      DataCell(Text('100.0')),
                      DataCell(Text('200.0')),
                    ],
                  ),
                  const DataRow(
                    cells: [
                      DataCell(Text('منتج 2')),
                      DataCell(Text('1')),
                      DataCell(Text('143.0')),
                      DataCell(Text('143.0')),
                    ],
                  ),
                  const DataRow(
                    cells: [
                      DataCell(Text('منتج 3')),
                      DataCell(Text('1')),
                      DataCell(Text('100.0')),
                      DataCell(Text('100.0')),
                    ],
                  ),
                ],
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
