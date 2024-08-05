






import 'package:flutter/material.dart';

class TextFieldDropdown extends StatefulWidget {
  const TextFieldDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TextFieldDropdownState createState() => _TextFieldDropdownState();
}

class _TextFieldDropdownState extends State<TextFieldDropdown> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.home),
            labelText: 'Select an Option',
            border: OutlineInputBorder(),
          ),
          value: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
          items: _dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select an option';
            }
            return null;
          },
        ),
      ),
    );
  }
}
