import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatelessWidget {
  final TextEditingController dateCtrl;
  const SelectDate({super.key, required this.dateCtrl});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => date(context),
      icon: const Icon(
        Icons.date_range,
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
