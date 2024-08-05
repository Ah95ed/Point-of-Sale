import 'package:flutter/material.dart';

class CardAddAccount extends StatelessWidget {
  String? name, number, description, edit;

  CardAddAccount({
    super.key,
    required this.name,
    required this.number,
    required this.description,
    required this.edit,
    required this.width,
  });
  double? width;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(name!),
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            width: (width),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                number!,
              ),
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            width: (width),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(description!),
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            width: (width),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(edit!),
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
        ],
      ),
    );
  }
}
