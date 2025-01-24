import 'package:flutter/material.dart';

import '../../models/game_details.dart';
import '../game_requirements_details.dart';


class GameRequirements extends StatelessWidget {
  final MinimumSystemRequirements requirements;

  const GameRequirements({Key? key, required this.requirements}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Requirements',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            GameRequirementsDetails(text: requirements.os ?? 'OS non spécifié'),
            GameRequirementsDetails(text: requirements.processor ?? 'Processeur non spécifié'),
            GameRequirementsDetails(text: requirements.graphics ?? 'Graphiques non spécifiés'),
            GameRequirementsDetails(text: requirements.memory ?? 'Mémoire non spécifiée'),
            GameRequirementsDetails(text: requirements.storage ?? 'Stockage non spécifié'),
          ],
        ),
      ],
    );
  }
}