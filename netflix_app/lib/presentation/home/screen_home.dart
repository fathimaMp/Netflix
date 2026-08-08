import 'package:flutter/material.dart';
import '../widgets/main_title.dart';
import 'widgets/standard_movie_list_view.dart';
import 'widgets/top_10_list_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  final String dummyImage =
      'https://media.themoviedb.org/t/p/w440_and_h660_face/5rhTDKUhPYvpdQIijFIs5VoWsON.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const MainTitle(title: "Released in the past year"),
            const SizedBox(height: 10),
            StandardMovieListView(imageUrl: dummyImage),
            const SizedBox(height: 20),

            const MainTitle(title: "Top 10 Tv Shows In India Today"),
            const SizedBox(height: 10),
            Top10ListView(imageUrl: dummyImage),
            const SizedBox(height: 20),

            const MainTitle(title: "Tense Dramas"),
            const SizedBox(height: 10),
            StandardMovieListView(imageUrl: dummyImage),
          ],
        ),
      ),
    );
  }
}