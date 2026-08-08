import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ValueNotifier to handle auto-hiding header on scroll down
ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder<bool>(
        valueListenable: scrollNotifier,
        builder: (context, isHeaderVisible, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  children: const [
                    _HeroCardWidget(),
                    SizedBox(height: 10),
                    _MainTitleCard(title: "Released in the Past Year"),
                    SizedBox(height: 15),
                    _MainTitleCard(title: "Trending Now"),
                    SizedBox(height: 15),
                    _Top10TitleCard(title: "Top 10 TV Shows in India Today"),
                    SizedBox(height: 20),
                  ],
                ),
                if (isHeaderVisible)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    // height: 120, // 👈 FIX 1: Increased height to fix bottom overflow
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: SafeArea( // 👈 FIX 2: Added SafeArea instead of hardcoded top padding
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              Image.network(
                                "https://pngimg.com/uploads/netflix/netflix_PNG25.png",
                                width: 40,
                                height: 40,
                                // 👈 FIX 3: Added error builder so the app doesn't crash if offline
                                errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.wifi_off, color: Colors.grey, size: 40), 
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.cast,
                                color: Colors.white,
                                size: 28,
                              ),
                              const SizedBox(width: 15),
                              Container(
                                width: 28,
                                height: 28,
                                color: Colors.blue, 
                              ),
                              const SizedBox(width: 15),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("TV Shows", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("Movies", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Row(
                                mainAxisSize: MainAxisSize.min, // 👈 FIX 4: Prevents horizontal overflow on the right
                                children: [
                                  Text("Categories", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  Icon(Icons.arrow_drop_down, color: Colors.white)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )             ],
            ),
          );
        },
      ),
    );
  }
}

// --- Hero Main Banner Widget (Matches image_b553ba.png) ---
class _HeroCardWidget extends StatelessWidget {
  const _HeroCardWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://image.tmdb.org/t/p/w500/kDp1vUBnMpeYrA3SuCM1L322R3z.jpg"), // Replace with Shyam Singha Roy URL
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark gradient at the bottom to blend with the list below
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
                colors: [Colors.black, Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                "Emotional • Romantic • Drama",
                style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.add, color: Colors.white),
                      Text("My List", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow, color: Colors.black, size: 28),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Play", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  const Column(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white),
                      Text("Info", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

// --- Standard Horizontal Movie List ---
class _MainTitleCard extends StatelessWidget {
  final String title;
  const _MainTitleCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("https://media.themoviedb.org/t/p/w440_and_h660_face/yQvGrMoipbRoddT0ZR8tPoR7NfX.jpg"),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

// --- Top 10 Special Horizontal List (Matches image_b5539c.jpg) ---
class _Top10TitleCard extends StatelessWidget {
  final String title;
  const _Top10TitleCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        LimitedBox(
          maxHeight: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 40), // Spacer so the image moves to the right of the number
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 125,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://media.themoviedb.org/t/p/w440_and_h660_face/yQvGrMoipbRoddT0ZR8tPoR7NfX.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Outlined Huge Number
                  Positioned(
                    left: 0,
                    bottom: -30,
                    child: Stack(
                      children: [
                        Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 130,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -10,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 4
                              ..color = Colors.white, // The white outline
                          ),
                        ),
                        Text(
                          "${index + 1}",
                          style: const TextStyle(
                            fontSize: 130,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -10,
                            color: Colors.black, // The black fill inside the outline
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}