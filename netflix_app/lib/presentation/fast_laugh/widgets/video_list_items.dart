import 'package:flutter/material.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Demo background colors to simulate full-screen media clips
    final List<String> posterImages = [
      'https://image.tmdb.org/t/p/w500/8Gxv8RS9UL33S33G2C2s.jpg',
    ];

    return Stack(
      children: [
        // Background Clip / Placeholder
        Container(
          color: Colors.accents[index % Colors.accents.length],
          child: Center(
            child: Text(
              'Video $index',
              style: const TextStyle(color: Colors.white38, fontSize: 32),
            ),
          ),
        ),

        // Mute / Unmute Button (Bottom Left)
        Positioned(
          bottom: 20,
          left: 20,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.black.withValues(alpha: 0.6),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_off, color: Colors.white, size: 20),
            ),
          ),
        ),

        // Right Action Bar (LOL, My List, Share, Play)
        Positioned(
          bottom: 20,
          right: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Avatar
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100',
                  ),
                ),
              ),

              // LOL Action
              const _VideoActionWidget(
                icon: Icons.emoji_emotions,
                title: 'LOL',
              ),

              // My List
              const _VideoActionWidget(
                icon: Icons.add,
                title: 'My List',
              ),

              // Share
              const _VideoActionWidget(
                icon: Icons.share,
                title: 'Share',
              ),

              // Play
              const _VideoActionWidget(
                icon: Icons.play_arrow,
                title: 'Play',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Reusable right-side action icon with caption
class _VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;

  const _VideoActionWidget({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}