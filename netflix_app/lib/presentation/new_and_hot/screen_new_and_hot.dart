import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: const Text('New & Hot', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            bottom: const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
              tabs: [Tab(text: 'Coming Soon'), Tab(text: 'Everyone’s Watching')],
            ),
          ),
          body: const TabBarView(children: [_ComingSoonList(), _EveryoneWatchingList()]),
        ),
      );
}

class _ComingSoonList extends StatefulWidget {
  const _ComingSoonList();
  @override
  State<_ComingSoonList> createState() => _ComingSoonListState();
}

class _ComingSoonListState extends State<_ComingSoonList> {
  late final _titles = TmdbCatalogRepository().upcomingMovies();
  @override
  Widget build(BuildContext context) => _CatalogFeed(future: _titles, comingSoon: true);
}

class _EveryoneWatchingList extends StatefulWidget {
  const _EveryoneWatchingList();
  @override
  State<_EveryoneWatchingList> createState() => _EveryoneWatchingListState();
}

class _EveryoneWatchingListState extends State<_EveryoneWatchingList> {
  late final _titles = TmdbCatalogRepository().trending();
  @override
  Widget build(BuildContext context) => _CatalogFeed(future: _titles, comingSoon: false);
}

class _CatalogFeed extends StatelessWidget {
  const _CatalogFeed({required this.future, required this.comingSoon});
  final Future<List<CatalogTitle>> future;
  final bool comingSoon;

  @override
  Widget build(BuildContext context) => FutureBuilder<List<CatalogTitle>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) return _FeedError(message: snapshot.error.toString());
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.white));
          final titles = snapshot.data!.where((title) => title.backdropUrl != null).toList();
          if (titles.isEmpty) return const _FeedError(message: 'TMDB returned no titles with artwork.');
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: titles.length,
            itemBuilder: (context, index) => _TitleCard(title: titles[index], comingSoon: comingSoon),
          );
        },
      );
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({required this.title, required this.comingSoon});
  final CatalogTitle title;
  final bool comingSoon;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                title.backdropUrl!,
                width: double.infinity,
                height: 205,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(height: 205, color: Colors.grey.shade900),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(title.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
                ),
                if (comingSoon) const Icon(Icons.notifications_none, color: Colors.white),
                const SizedBox(width: 18),
                const Icon(Icons.info_outline, color: Colors.white),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              comingSoon
                  ? 'Coming ${title.releaseDate.isEmpty ? 'soon' : title.releaseDate}'
                  : 'Trending now · ${title.mediaType == 'tv' ? 'Series' : 'Movie'}',
              style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            if (title.overview.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(title.overview, maxLines: 3, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white60, height: 1.4)),
            ],
          ],
        ),
      );
}

class _FeedError extends StatelessWidget {
  const _FeedError({required this.message});
  final String message;
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
        ),
      );
}
