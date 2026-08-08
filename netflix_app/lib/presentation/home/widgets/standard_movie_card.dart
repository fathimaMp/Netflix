import 'package:flutter/material.dart';

class StandardMovieCard extends StatelessWidget {
  final String imageUrl;

  const StandardMovieCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // slightly softer corners
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}