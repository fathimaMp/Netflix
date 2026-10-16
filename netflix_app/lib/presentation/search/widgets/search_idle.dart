import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';

class SearchIdleWidgets extends StatefulWidget {
  const SearchIdleWidgets({super.key});
  @override
  State<SearchIdleWidgets> createState() => _SearchIdleWidgetsState();
}

class _SearchIdleWidgetsState extends State<SearchIdleWidgets> {
  late final Future<List<CatalogTitle>> _titles = TmdbCatalogRepository().trending();

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Top Searches', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<CatalogTitle>>(
              future: _titles,
              builder: (context, snapshot) {
                if (snapshot.hasError) return Center(child: Text(snapshot.error.toString(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)));
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.white));
                final titles = snapshot.data!.where((title) => title.backdropUrl != null).toList();
                if (titles.isEmpty) return const Center(child: Text('No trending titles found.', style: TextStyle(color: Colors.white70)));
                return ListView.separated(
                  itemCount: titles.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) => _TopSearchItem(title: titles[index]),
                );
              },
            ),
          ),
        ],
      );
}

class _TopSearchItem extends StatelessWidget {
  const _TopSearchItem({required this.title});
  final CatalogTitle title;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(title.backdropUrl!, width: MediaQuery.sizeOf(context).width * .35, height: 70, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(width: MediaQuery.sizeOf(context).width * .35, height: 70, color: Colors.grey.shade900)),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(title.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
          const Icon(Icons.play_circle_outline, color: Colors.white, size: 35),
        ],
      );
}
