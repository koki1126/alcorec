import 'package:alcorec/record/record.dart';
import 'package:flutter/material.dart';

class Float extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.brown.shade600,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Record(),
          ),
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white70,
      ),
    );
  }
}
