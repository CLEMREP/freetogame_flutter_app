import 'dart:async';
import 'package:boilerplate_alls_plateforms/widgets/game_details/game_footer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/game_details.dart';
import '../widgets/game_details/game_description.dart';
import '../widgets/game_details/game_header.dart';
import '../widgets/game_details/game_image_carousel.dart';
import '../widgets/game_details/game_requirements.dart';

class GameDetailScreen extends StatefulWidget {
  final GameDetails gameDetails;

  const GameDetailScreen({Key? key, required this.gameDetails}) : super(key: key);

  @override
  _GameDetailScreenState createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < widget.gameDetails.screenshots.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrousel d'images
            GameImageCarousel(
              screenshots: widget.gameDetails.screenshots,
              pageController: _pageController,
              currentPage: _currentPage,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // En-tête avec titre et description courte
                      GameHeader(
                        title: widget.gameDetails.title,
                        shortDescription: widget.gameDetails.shortDescription,
                        publisher: widget.gameDetails.publisher,
                      ),
                      const SizedBox(height: 16),
                      // Section des exigences
                      GameRequirements(
                        requirements: widget.gameDetails.minimumSystemRequirements,
                      ),
                      const SizedBox(height: 16),
                      // Description
                      GameDescription(
                        description: widget.gameDetails.description,
                      ),
                      const SizedBox(height: 24),
                      // Footer
                      GameInfoFooter(
                        releaseDate: widget.gameDetails.releaseDate,
                        developer: widget.gameDetails.developer,
                        onShare: () {
                          _launchUrl(Uri.parse(widget.gameDetails.gameUrl));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}