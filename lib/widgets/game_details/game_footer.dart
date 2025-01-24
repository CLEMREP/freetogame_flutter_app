import 'package:flutter/material.dart';

class GameInfoFooter extends StatelessWidget {
  final String releaseDate;
  final String developer;
  final VoidCallback onShare;

  const GameInfoFooter({
    Key? key,
    required this.releaseDate,
    required this.developer,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text('Date de sortie : $releaseDate', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.developer_mode, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text('Développeur : $developer', style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        Center(
          child: ElevatedButton(
            onPressed: onShare,
            child: const Text('Jouer maintenant !'),
          ),
        )
      ],
    );
  }
}