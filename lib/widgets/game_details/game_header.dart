import 'package:flutter/material.dart';

class GameHeader extends StatelessWidget {
  final String title;
  final String shortDescription;
  final String publisher;

  const GameHeader({
    Key? key,
    required this.title,
    required this.shortDescription,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          shortDescription,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(publisher, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}