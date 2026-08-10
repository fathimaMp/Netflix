import 'package:flutter/material.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "New & Hot",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 10),
            Container(
              width: 28,
              height: 28,
              color: Colors.blueGrey, // Placeholder for profile image
            ),
            const SizedBox(width: 10),
          ],
          bottom: PreferredSize(
  preferredSize: const Size.fromHeight(50),
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TabBar(
      isScrollable: false, // Spreads tabs evenly across full screen width
      indicatorSize: TabBarIndicatorSize.tab, // Extends white pill to fill each tab
      labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      indicator: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      dividerColor: Colors.transparent,
      tabs: const [
        Tab(text: "🍿 Coming Soon"),
        Tab(text: "👀 Everyone's Watching"),
      ],
    ),
  ),
),
         ),
        body: const TabBarView(
          children: [
            _ComingSoonList(),
            _EveryonesWatchingList(), // Replaced placeholder with the new list
          ],
        ),
      ),
    );
  }
}

// --- Coming Soon List Builder ---
class _ComingSoonList extends StatelessWidget {
  const _ComingSoonList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const _ComingSoonWidget();
      },
    );
  }
}

// --- Everyone's Watching List Builder ---
class _EveryonesWatchingList extends StatelessWidget {
  const _EveryonesWatchingList();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return const _EveryonesWatchingWidget();
      },
    );
  }
}

// --- Individual Everyone's Watching Widget Layout ---
class _EveryonesWatchingWidget extends StatelessWidget {
  const _EveryonesWatchingWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Video/Image Thumbnail
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg"



), // Placeholder image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                radius: 20,
                child: const Icon(
                  Icons.volume_off,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        
        // Logo & Actions Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Side Logo (Using Text as Placeholder for the Lost In Space logo)
            const Text(
              "LOST IN\nSPACE",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            
            // Right Side Actions
            const Row(
              children: [
                _CustomActionWidget(
                  icon: Icons.send,
                  title: "Share",
                ),
                SizedBox(width: 25),
                _CustomActionWidget(
                  icon: Icons.add,
                  title: "My List",
                ),
                SizedBox(width: 25),
                _CustomActionWidget(
                  icon: Icons.play_arrow,
                  title: "Play",
                ),
                SizedBox(width: 10),
              ],
            )
          ],
        ),
        const SizedBox(height: 15),

        // Netflix Series Badge
        Row(
          children: [
            Image.network(
              'https://pngimg.com/uploads/netflix/netflix_PNG25.png',
              width: 15,
              height: 15,
            ),
            const SizedBox(width: 5),
            const Text(
              "S E R I E S",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.grey,
              ),
            )
          ],
        ),
        const SizedBox(height: 8),

        // Main Title
        const Text(
          "Lost in Space",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Description
        const Text(
          "After crash-landing on an alien planet, the Robinson family fights against all odds to survive and escape.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 40), // Spacing before the next item
      ],
    );
  }
}

// --- Individual Coming Soon Widget Layout ---
class _ComingSoonWidget extends StatelessWidget {
  const _ComingSoonWidget();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side: Date Segment
        const SizedBox(
          width: 50,
          child: Column(
            children: [
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        
        // Right Side: Movie Details Segment
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Video/Image Thumbnail
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg"), 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      radius: 20,
                      child: const Icon(
                        Icons.volume_off,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              
              // Title Image/Text & Actions Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALL GIRL 2",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      _CustomActionWidget(
                        icon: Icons.notifications_none,
                        title: "Remind Me",
                      ),
                      SizedBox(width: 20),
                      _CustomActionWidget(
                        icon: Icons.info_outline,
                        title: "Info",
                      ),
                      SizedBox(width: 10),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10),
              
              // Coming Soon Subtitle
              const Text(
                "Coming on Friday",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              
              // Netflix Series Logo
              Row(
                children: [
                  Image.network(
                    'https://pngimg.com/uploads/netflix/netflix_PNG25.png',
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    "S E R I E S",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              
              // Main Title
              const Text(
                "Tall Girl 2",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              
              // Description
              const Text(
                "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends her confidence — and her relationship — into a tailspin.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}

// --- Helper Widget for Actions (Remind Me / Info / Share / Play) ---
class _CustomActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const _CustomActionWidget({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}