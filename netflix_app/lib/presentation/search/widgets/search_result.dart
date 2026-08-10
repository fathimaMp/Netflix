import 'package:flutter/material.dart';

// Verified, working poster URLs
const List<String> posterUrls = [
 "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg"


];

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Movies & TV",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 3 columns grid
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.5, // Standard poster ratio
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              // Cycles through working poster URLs dynamically
              final imageUrl = posterUrls[index % posterUrls.length];
              return MainCard(imageUrl: imageUrl);
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;

  const MainCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        // Safe fallback if the connection drops or the URL breaks (404)
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[850],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.movie, color: Colors.white38, size: 30),
                SizedBox(height: 4),
                Text(
                  "No Image",
                  style: TextStyle(color: Colors.white38, fontSize: 10),
                ),
              ],
            ),
          );
        },
        // Progress loading spinner while image downloads
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.grey[900],
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}