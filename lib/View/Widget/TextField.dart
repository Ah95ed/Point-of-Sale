import 'package:flutter/material.dart';

import '../Colors/Colors.dart';

// ignore: must_be_immutable
class TextFieldCustom extends StatefulWidget {
  TextFieldCustom({
    super.key,
    this.name,
    this.icons,
    this.text,
    this.input,
  });
  String? name;
  IconData? icons;
  TextEditingController? text;
  TextInputType? input;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  void dispose() {
    super.dispose();
    widget.text!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.text,
        keyboardType:
            widget.input == null ? TextInputType.text : TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.name,
          prefixIcon: Icon(
            widget.icons,
            color: ColorUsed.appBarColor,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorUsed.appBarColor,
            ),
          ),
          labelStyle: TextStyle(
            color: ColorUsed.appBarColor,
          ),
        ),
      ),
    );
  }
}
