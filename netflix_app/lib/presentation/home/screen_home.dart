import 'package:flutter/material.dart';
import '../widgets/main_title.dart';
import 'widgets/standard_movie_list_view.dart';
import 'widgets/top_10_list_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  final String dummyImage =
      "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg";

  // You can replace this with the actual Shyam Singha Roy poster URL later
  final String heroImage =
      "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // Removed SafeArea so the hero image reaches the very top of the screen
      body: ListView(
        padding: EdgeInsets.zero, // Removed padding so image stretches edge-to-edge
        children: [
          
          // --- HERO SECTION (Main Top Image) ---
          Stack(
            children: [
              // 1. The Large Background Image
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(heroImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 2. The Bottom Gradient (fades image into the black background)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // 3. The Text and Buttons over the image
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Text(
                      "Emotional • Romantic • Drama",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 14, 
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildVerticalButton(icon: Icons.add, title: "My List"),
                        _buildPlayButton(),
                        _buildVerticalButton(icon: Icons.info_outline, title: "Info"),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),

          // --- HORIZONTAL LISTS ---
          
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            child: MainTitle(title: "Released in the Past Year"),
          ),
          const SizedBox(height: 10),
          StandardMovieListView(imageUrl: dummyImage),
          const SizedBox(height: 20),

          // Added "Trending Now" to match your screenshots
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: MainTitle(title: "Trending Now"),
          ),
          const SizedBox(height: 10),
          StandardMovieListView(imageUrl: dummyImage),
          const SizedBox(height: 20),

          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: MainTitle(title: "Top 10 TV Shows in India Today"),
          ),
          const SizedBox(height: 10),
          Top10ListView(imageUrl: dummyImage),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS FOR THE HERO BUTTONS ---

  Widget _buildVerticalButton({required IconData icon, required String title}) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(
          title, 
          style: const TextStyle(
            color: Colors.white, 
            fontSize: 13, 
            fontWeight: FontWeight.bold
          )
        ),
      ],
    );
  }

  Widget _buildPlayButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Row(
        children: [
          Icon(Icons.play_arrow, color: Colors.black, size: 30),
          SizedBox(width: 5),
          Text(
            "Play",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}