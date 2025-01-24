import 'package:flutter/material.dart';

class GenreFilterBar extends StatelessWidget {
  final List<String> genres;
  final String? selectedGenre;
  final ValueChanged<String?> onGenreSelected;

  const GenreFilterBar({
    Key? key,
    required this.genres,
    required this.selectedGenre,
    required this.onGenreSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...['Tous', ...genres].map((genre) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: FilterChip(
              label: Text(genre),
              selected: selectedGenre == (genre == 'Tous' ? null : genre),
              onSelected: (_) => onGenreSelected(genre == 'Tous' ? null : genre),
            ),
          )),
        ],
      ),
    );
  }
}