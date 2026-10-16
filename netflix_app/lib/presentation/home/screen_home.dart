import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';
import 'package:netflix_app/presentation/widgets/catalog_future_section.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _repository = TmdbCatalogRepository();
  late final Future<List<CatalogTitle>> _heroTitles = _repository.trending();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<List<CatalogTitle>>(
            future: _heroTitles,
            builder: (context, snapshot) {
              final titles = snapshot.data;
              final hero = titles != null && titles.isNotEmpty ? titles.first : null;
              return _hero(hero, snapshot.error, snapshot.connectionState == ConnectionState.waiting);
            },
          ),
          CatalogFutureSection(
            title: 'Released in the Past Year',
            load: (repository) => repository.releasedPastYear(),
          ),
          const SizedBox(height: 20),
          CatalogFutureSection(
            title: 'Trending Now',
            load: (repository) => repository.trending(),
          ),
          const SizedBox(height: 20),
          CatalogFutureSection(
            title: 'Top 10 TV Shows in India Today',
            load: (repository) => repository.popularTvInIndia(),
            ranked: true,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _hero(CatalogTitle? title, Object? error, bool isLoading) {
    final imageUrl = title?.backdropUrl;
    return SizedBox(
      height: 580,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (imageUrl != null)
            Image.network(imageUrl, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade900))
          else
            Container(color: Colors.grey.shade900),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black26, Colors.transparent, Colors.black],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 24,
            child: Column(
              children: [
                Text(
                  title?.name ?? (isLoading ? 'Loading titles…' : 'TMDB catalog unavailable'),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                if (title == null && error != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
                if (title != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    title.overview,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _HeroButton(icon: Icons.add, title: 'My List'),
                    FilledButton.icon(
                      onPressed: title == null ? null : () {},
                      style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                    ),
                    _HeroButton(icon: Icons.info_outline, title: 'Info'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroButton extends StatelessWidget {
  const _HeroButton({required this.icon, required this.title});
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      );
}
