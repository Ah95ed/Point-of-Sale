import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:point_of_sell/View/Widget/TextField.dart';

class AdditinoalData extends StatelessWidget {
  const AdditinoalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldCustom(
                name: 'specifications'.tr,
                icons: Icons.opacity,
                text: TextEditingController(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldCustom(
                name: 'location'.tr,
                icons: Icons.location_city_sharp,
                text: TextEditingController(),
              ),
            ),
          ],
        ),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(
              name: 'source'.tr,
              icons: Icons.source,
              text: TextEditingController(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFieldCustom(
              name: 'comments'.tr,
              icons: Icons.notes,
              text: TextEditingController(),
            ),
          ),
        ]),
      ],
    );
  }
}
