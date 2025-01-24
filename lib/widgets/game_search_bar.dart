import 'package:flutter/material.dart';

class GameSearchBar extends StatelessWidget {
  final String searchText;
  final ValueChanged<String> onSearchTextChanged;

  const GameSearchBar({
    Key? key,
    required this.searchText,
    required this.onSearchTextChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Chercher un jeu...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.grey),
        ),
        filled: true,
        fillColor: Colors.white70,
      ),
      onChanged: onSearchTextChanged,
    );
  }
}