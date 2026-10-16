import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';
import 'package:netflix_app/presentation/widgets/catalog_poster_row.dart';

class CatalogFutureSection extends StatefulWidget {
  const CatalogFutureSection({
    super.key,
    required this.title,
    required this.load,
    this.ranked = false,
  });

  final String title;
  final Future<List<CatalogTitle>> Function(TmdbCatalogRepository repository) load;
  final bool ranked;

  @override
  State<CatalogFutureSection> createState() => _CatalogFutureSectionState();
}

class _CatalogFutureSectionState extends State<CatalogFutureSection> {
  final _repository = TmdbCatalogRepository();
  late Future<List<CatalogTitle>> _titles;

  @override
  void initState() {
    super.initState();
    _titles = widget.load(_repository);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(widget.title,
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        FutureBuilder<List<CatalogTitle>>(
          future: _titles,
          builder: (context, snapshot) {
            if (snapshot.hasError) return _error(snapshot.error.toString());
            if (!snapshot.hasData) {
              return const SizedBox(height: 160, child: Center(child: CircularProgressIndicator()));
            }
            return CatalogPosterRow(titles: snapshot.data!, ranked: widget.ranked);
          },
        ),
      ],
    );
  }

  Widget _error(String message) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, style: const TextStyle(color: Colors.white70)),
      );
}
