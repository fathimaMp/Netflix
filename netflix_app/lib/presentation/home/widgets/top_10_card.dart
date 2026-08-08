import 'package:flutter/material.dart';
import 'standard_movie_card.dart';

class Top10Card extends StatelessWidget {
  final int index;
  final String imageUrl;

  const Top10Card({
    super.key,
    required this.index,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // 👈 FIX: Prevents the large numbers from getting cut off at the bottom
      children: [
        Row(
          children: [
            const SizedBox(width: 40),
            StandardMovieCard(imageUrl: imageUrl),
          ],
        ),
        Positioned(
          bottom: -25, // Pulled down slightly for better effect
          left: 0,
          child: Stack(
            children: [
              // The White Outline (Stroke)
              Text(
                "${index + 1}",
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -10, // Pulls double digits like '10' closer together
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.white,
                ),
              ),
              // The Black Fill inside the text
              Text(
                "${index + 1}",
                style: const TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -10,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}