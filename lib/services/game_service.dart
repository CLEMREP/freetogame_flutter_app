import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';
import '../models/game_details.dart';

class GameService {
  static Future<List<Game>> fetchGames() async {
    final url = 'https://www.freetogame.com/api/games';
    final data = await _fetchData(url);
    return data.map<Game>((json) => Game.fromJson(json)).toList();
  }

  static Future<GameDetails> fetchGameDetails(int gameId) async {
    final url = 'https://www.freetogame.com/api/game?id=$gameId';
    final data = await _fetchData(url);
    return GameDetails.fromJson(data);
  }

  static Future<dynamic> _fetchData(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Un problème est survenu lors de la récupération des données');
    }
  }
}