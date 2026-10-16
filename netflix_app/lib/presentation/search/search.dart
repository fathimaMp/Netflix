import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';
import 'package:netflix_app/infrastructure/catalog/tmdb_catalog_repository.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});
  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final _repository = TmdbCatalogRepository();
  Timer? _debounce;
  String _query = '';
  Future<List<CatalogTitle>>? _results;

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();
    setState(() {
      _query = query;
      _results = null;
    });
    if (query.isNotEmpty) {
      _debounce = Timer(const Duration(milliseconds: 350), () {
        if (mounted && query == _query) {
          setState(() => _results = _repository.search(query));
        }
      });
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withValues(alpha: 0.3),
                  prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
                  style: const TextStyle(color: Colors.white),
                  onChanged: _onQueryChanged,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: _query.isEmpty
                      ? const SearchIdleWidgets()
                      : _results == null
                          ? const Center(child: CircularProgressIndicator(color: Colors.white))
                          : FutureBuilder<List<CatalogTitle>>(
                              future: _results!,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) return _SearchError(snapshot.error.toString());
                                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: Colors.white));
                                return SearchResultWidget(titles: snapshot.data!);
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _SearchError extends StatelessWidget {
  const _SearchError(this.message);
  final String message;
  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
        ),
      );
}
