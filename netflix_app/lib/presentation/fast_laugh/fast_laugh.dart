import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_items.dart';

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});
  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  late final Future<List<CatalogTitle>> _titles = TmdbCatalogRepository().trending();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: FutureBuilder<List<CatalogTitle>>(
            future: _titles,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(snapshot.error.toString(), textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70)),
                  ),
                );
              }
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.white));
              final titles = snapshot.data!.where((title) => title.backdropUrl != null).toList();
              if (titles.isEmpty) return const Center(child: Text('No trending titles found.', style: TextStyle(color: Colors.white70)));
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: titles.length,
                itemBuilder: (context, index) => VideoListItem(title: titles[index]),
              );
            },
          ),
        ),
      );
}
