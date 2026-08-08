import 'package:flutter/material.dart';
import 'top_10_card.dart';

class Top10ListView extends StatelessWidget {
  final String imageUrl;

  const Top10ListView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 10), // Keep spacing consistent with the Top10Card offset
        itemBuilder: (context, index) {
          return Top10Card(
            index: index,
            imageUrl: imageUrl,
          );
        },
      ),
    );
  }
}