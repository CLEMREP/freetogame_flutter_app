import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/game_details.dart';
import '../helpers/build_icon.dart';

class GameImageCarousel extends StatelessWidget {
  final List<Screenshot> screenshots;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onPageChanged;

  const GameImageCarousel({
    Key? key,
    required this.screenshots,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: screenshots.map((screenshot) {
              return Image.network(screenshot.image, fit: BoxFit.cover);
            }).toList(),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildIcon(Icons.arrow_back, () => Navigator.pop(context)),
                buildIcon(Icons.share, () {
                  Share.share(
                    'Découvrez ce jeu : ${screenshots[0].image}',
                    subject: 'Découvrez ce super jeu !',
                  );
                }),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${currentPage + 1}/${screenshots.length}',
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}