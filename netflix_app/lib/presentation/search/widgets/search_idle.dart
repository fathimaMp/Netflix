import 'package:flutter/material.dart';
import 'dart:io';


// Landscape image for wide thumbnail display
const imageUrl =
  "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg";

class SearchIdleWidgets extends StatelessWidget {
  const SearchIdleWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Searches",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchItemTile(),
            separatorBuilder: (ctx, index) => const SizedBox(height: 10),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

// Tile widget for each search item
class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: Colors.white,
          size: 35,
        ),
      ],
    );
  }
}


void checkConnection() async {
  try {
    final result = await InternetAddress.lookup('media.themoviedb.org');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Internet connected!');
    }
  } on SocketException catch (_) {
    print('No internet connection on emulator');
  }
}