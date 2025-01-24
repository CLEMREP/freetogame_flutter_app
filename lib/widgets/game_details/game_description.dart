import 'package:flutter/material.dart';

class GameDescription extends StatelessWidget {
  final String description;

  const GameDescription({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(description, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}