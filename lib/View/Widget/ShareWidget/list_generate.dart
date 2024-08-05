
import 'package:flutter/material.dart';

List<TableRow> ListViewGenerateInTable(List data) {
    return List.generate(
      data.length,
      (i) {
        // log('message ${data[i]}');
        return TableRow(
          children: [
            Center(child: Text(data[i])),
            Center(child: Text(data[i])),
            Center(child: Text(data[i])),
            Center(child: Text(data[i])),
            Center(child: Text(data[i])),
            Center(child: Text(data[i])),
            Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.recycling,
                ),
              ),
            ),
          ],
        );
      },
    );
  }