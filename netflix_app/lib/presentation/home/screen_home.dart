import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';
import 'package:netflix_app/presentation/widgets/catalog_future_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final _repository = TmdbCatalogRepository();
  late final Future<List<CatalogTitle>> _heroTitles = _repository.trending();
  final Map<int, CatalogTitle> _myListTitles = {};

  Future<void> _playTrailer(CatalogTitle title) async {
    try {
      final uri = await _repository.trailerUri(title);
      if (!mounted) return;
      if (uri == null) {
        _showMessage('No trailer is available for ${title.name}.');
        return;
      }
      final opened = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!opened && mounted) _showMessage('Could not open the trailer.');
    } catch (error) {
      if (mounted) _showMessage('Could not load trailer: $error');
    }
  }

  void _toggleMyList(CatalogTitle title) {
    final added = !_myListTitles.containsKey(title.id);
    setState(() {
      if (added) {
        _myListTitles[title.id] = title;
      } else {
        _myListTitles.remove(title.id);
      }
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(added ? 'Added ${title.name} to My List.' : 'Removed ${title.name} from My List.'),
          action: added ? SnackBarAction(label: 'VIEW', onPressed: _showMyList) : null,
        ),
      );
  }

  void _showMyList() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('My List', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: 360,
          child: _myListTitles.isEmpty
              ? const Text('Your list is empty.', style: TextStyle(color: Colors.white70))
              : ListView(
                  shrinkWrap: true,
                  children: _myListTitles.values
                      .map((title) => ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: title.posterUrl == null
                                ? const Icon(Icons.movie_outlined, color: Colors.white70)
                                : Image.network(title.posterUrl!, width: 42, fit: BoxFit.cover),
                            title: Text(title.name, style: const TextStyle(color: Colors.white)),
                            trailing: IconButton(
                              tooltip: 'Remove from My List',
                              icon: const Icon(Icons.remove_circle_outline, color: Colors.white70),
                              onPressed: () {
                                setState(() => _myListTitles.remove(title.id));
                                Navigator.of(context).pop();
                                _showMyList();
                              },
                            ),
                          ))
                      .toList(),
                ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  void _showInfo(CatalogTitle title) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: Text(title.name, style: const TextStyle(color: Colors.white)),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${title.mediaType == 'tv' ? 'TV show' : 'Movie'}'
                  '${title.releaseDate.isEmpty ? '' : ' • ${title.releaseDate}'}'
                  ' • ★ ${title.voteAverage.toStringAsFixed(1)}',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 12),
                Text(
                  title.overview.isEmpty ? 'No description is available.' : title.overview,
                  style: const TextStyle(color: Colors.white, height: 1.4),
                ),
              ],
            ),
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

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
                    _HeroButton(
                      icon: title != null && _myListTitles.containsKey(title.id) ? Icons.check : Icons.add,
                      title: title != null && _myListTitles.containsKey(title.id) ? 'Added' : 'My List',
                      onTap: title == null ? null : () => _toggleMyList(title),
                    ),
                    FilledButton.icon(
                      onPressed: title == null ? null : () => _playTrailer(title),
                      style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play'),
                    ),
                    _HeroButton(
                      icon: Icons.info_outline,
                      title: 'Info',
                      onTap: title == null ? null : () => _showInfo(title),
                    ),
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
  const _HeroButton({required this.icon, required this.title, this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              Icon(icon, color: Colors.white, size: 28),
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
}
