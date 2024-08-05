import 'package:flutter/material.dart';

class Wait extends StatelessWidget {
  const Wait({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 8,
            ),
            Text('Wait'),
          ],
      ),
    );
  }
}
