import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:point_of_sell/View/style/SizeApp/ScreenSize.dart';

class SelectDate extends StatelessWidget {
  final TextEditingController dateCtrl;
  const SelectDate({super.key, required this.dateCtrl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
   
      onPressed: () => date(context),
      icon: Icon(
        Icons.date_range,
  size: context.getMinSize(18),
      ),
    );
  }

  date(context) async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 6),
    );
    if (dateTime != null) {
      dateCtrl.text = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    }
  }
}
