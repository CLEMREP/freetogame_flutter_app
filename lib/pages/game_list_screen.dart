import 'package:boilerplate_alls_plateforms/widgets/game_search_bar.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/game_service.dart';
import '../widgets/game_list_tile.dart';
import '../widgets/genre_filter_bar.dart';
import 'game_detail_screen.dart';

class GameListScreen extends StatefulWidget {
  @override
  _GameListScreenState createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  late Future<List<Game>> _gamesFuture;
  String? _selectedGenre;
  String _searchText = '';
  List<Game> _allGames = [];
  List<Game> _filteredGames = [];
  List<String> _genres = [];

  @override
  void initState() {
    super.initState();
    _loadGames();
  }

  Future<void> _loadGames() async {
    _gamesFuture = GameService.fetchGames();
    _allGames = await _gamesFuture;
    _applyFilters();
    _extractGenres();
  }

  void _extractGenres() {
    final genresSet = <String>{};
    for (var game in _allGames) {
      genresSet.add(game.genre);
    }
    setState(() {
      _genres = genresSet.toList();
    });
  }

  void _applyFilters() {
    setState(() {
      _filteredGames = _allGames.where((game) {
        final matchesSearch = game.title
            .toLowerCase()
            .contains(_searchText.toLowerCase());
        final matchesGenre = _selectedGenre == null || game.genre == _selectedGenre;
        return matchesSearch && matchesGenre;
      }).toList();
    });
  }

  void _onSearchTextChanged(String text) {
    setState(() {
      _searchText = text;
      _applyFilters();
    });
  }

  void _onGenreSelected(String? genre) {
    setState(() {
      _selectedGenre = genre;
      _applyFilters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreeToGame'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: Image.network('https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D').image, // Replace with your profile image URL
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Bryan!',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'bryan@example.com',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.notifications_none),
                  onPressed: () {
                    //
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GameSearchBar(
              searchText: _searchText,
              onSearchTextChanged: _onSearchTextChanged,
            ),
          ),
          GenreFilterBar(
            genres: _genres,
            selectedGenre: _selectedGenre,
            onGenreSelected: _onGenreSelected,
          ),
          Expanded(
            child: FutureBuilder<List<Game>>(
              future: _gamesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erreur: ${snapshot.error}'));
                } else if (_filteredGames.isEmpty) {
                  return Center(child: Text('Aucun jeu trouvé'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ListView.builder(
                      itemCount: _filteredGames.length,
                      itemBuilder: (context, index) {
                        final game = _filteredGames[index];
                        return GameListTile(
                          game: game,
                          onTap: () async {
                            final gameDetails = await GameService.fetchGameDetails(game.id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetailScreen(gameDetails: gameDetails),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}