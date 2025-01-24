import 'package:flutter/material.dart';
import '../models/game.dart';

class GameListTile extends StatelessWidget {
  final Game game;
  final VoidCallback onTap;

  const GameListTile({Key? key, required this.game, required this.onTap}) : super(key: key);

  Color _getGenreColor(String genre) {
    switch (genre) {
      case 'MMORPG':
        return Colors.purple;
      case 'Shooter':
        return Colors.red;
      case 'Strategy':
        return Colors.green;
      case 'Action RPG':
        return Colors.amber;
      case 'Battle Royale':
        return Colors.indigo;
      case 'ARPG':
        return Colors.deepOrange;
      case 'MMOARPG':
        return Colors.deepPurple;
      case 'MOBA':
        return Colors.blue;
      case 'Racing':
        return Colors.orange;
      case 'Sports':
        return Colors.teal;
      case 'Fighting':
        return Colors.pink;
      case 'Card Gale':
        return Colors.brown;
      case 'Social':
        return Colors.lightBlue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image.network(
                game.thumbnail,
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: _getGenreColor(game.genre),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      game.genre,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    game.shortDescription,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}