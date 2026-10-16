import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.titles});
  final List<CatalogTitle> titles;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Movies & TV', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Expanded(
            child: titles.isEmpty
                ? const Center(child: Text('No matching titles found.', style: TextStyle(color: Colors.white70)))
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5,
                    ),
                    itemCount: titles.length,
                    itemBuilder: (context, index) {
                      final path = titles[index].posterUrl;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: path == null
                            ? Container(color: Colors.grey.shade900, child: const Icon(Icons.movie, color: Colors.white38))
                            : Image.network(path, fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(color: Colors.grey.shade900, child: const Icon(Icons.movie, color: Colors.white38)),
                                loadingBuilder: (_, child, progress) => progress == null
                                    ? child
                                    : Container(color: Colors.grey.shade900, child: const Center(child: CircularProgressIndicator(strokeWidth: 2, color: Colors.red))),
                              ),
                      );
                    },
                  ),
          ),
        ],
      );
}
