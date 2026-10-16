import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';

class VideoListItem extends StatelessWidget {
  const VideoListItem({super.key, required this.title});
  final CatalogTitle title;

  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          Image.network(title.backdropUrl!, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade900)),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black26, Colors.black87],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 76,
            bottom: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title.name, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(title.overview, maxLines: 4, overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, height: 1.4)),
                const SizedBox(height: 10),
                Text(title.mediaType == 'tv' ? 'Series · TMDB trending' : 'Movie · TMDB trending',
                    style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Positioned(
            right: 14,
            bottom: 32,
            child: Column(
              children: [
                _VideoAction(icon: Icons.thumb_up_alt_outlined, title: 'Like'),
                _VideoAction(icon: Icons.add, title: 'My List'),
                _VideoAction(icon: Icons.share_outlined, title: 'Share'),
              ],
            ),
          ),
        ],
      );
}

class _VideoAction extends StatelessWidget {
  const _VideoAction({required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Column(children: [
          Icon(icon, color: Colors.white, size: 29),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ]),
      );
}
