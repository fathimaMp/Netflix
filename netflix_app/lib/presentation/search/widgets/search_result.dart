import 'package:flutter/material.dart';

const posterUrl =
    "https://media.themoviedb.org/t/p/w440_and_h660_face/yQvGrMoipbRoddT0ZR8tPoR7NfX.jpg  ";

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
              return const MainCard();
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(posterUrl),
        ),
      ),
    );
  }
}