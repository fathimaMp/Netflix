import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';

class CatalogPosterRow extends StatelessWidget {
  const CatalogPosterRow({
    super.key,
    required this.titles,
    this.ranked = false,
    this.height = 190,
  });

  final List<CatalogTitle> titles;
  final bool ranked;
  final double height;

  @override
  Widget build(BuildContext context) {
    final visibleTitles = titles.where((title) => title.posterUrl != null).toList();
    if (visibleTitles.isEmpty) {
      return const SizedBox(
        height: 110,
        child: Center(
          child: Text('No titles available', style: TextStyle(color: Colors.white54)),
        ),
      );
    }
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: visibleTitles.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => SizedBox(
          width: ranked ? 160 : 125,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    visibleTitles[index].posterUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade900,
                      child: const Icon(Icons.movie_outlined, color: Colors.white38),
                    ),
                  ),
                ),
              ),
              if (ranked)
                Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 76,
                    height: 0.95,
                    fontWeight: FontWeight.w900,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
