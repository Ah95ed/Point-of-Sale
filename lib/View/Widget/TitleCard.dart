import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('name'),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('number'),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Title'),
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            width: 2.0,
            height: MediaQuery.of(context).size.height,
          ),
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text('Edit'),
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
