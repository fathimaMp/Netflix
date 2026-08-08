import 'package:flutter/material.dart';
import 'standard_movie_card.dart';

class StandardMovieListView extends StatelessWidget {
  final String imageUrl;

  const StandardMovieListView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return StandardMovieCard(imageUrl: imageUrl);
        },
      ),
    );
  }
}