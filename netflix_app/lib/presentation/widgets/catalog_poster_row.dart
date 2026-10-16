import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/domain/catalog/catalog_title.dart';

class CatalogPosterRow extends StatefulWidget {
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
  State<CatalogPosterRow> createState() => _CatalogPosterRowState();
}

class _CatalogPosterRowState extends State<CatalogPosterRow> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scroll(double direction) {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    final target = (position.pixels + direction * position.viewportDimension * 0.8)
        .clamp(0.0, position.maxScrollExtent)
        .toDouble();
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleTitles = widget.titles.where((title) => title.posterUrl != null).toList();
    if (visibleTitles.isEmpty) {
      return const SizedBox(
        height: 110,
        child: Center(
          child: Text('No titles available', style: TextStyle(color: Colors.white54)),
        ),
      );
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Scrollbar(
            controller: _scrollController,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(4),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.trackpad,
                },
              ),
              child: ListView.separated(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 8),
                itemCount: visibleTitles.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) => SizedBox(
                  width: widget.ranked ? 160 : 125,
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
                      if (widget.ranked)
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
            ),
          ),
          Positioned(
            left: 4,
            top: (widget.height - 42) / 2,
            child: _ScrollButton(
              icon: Icons.chevron_left,
              onPressed: () => _scroll(-1),
            ),
          ),
          Positioned(
            right: 4,
            top: (widget.height - 42) / 2,
            child: _ScrollButton(
              icon: Icons.chevron_right,
              onPressed: () => _scroll(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollButton extends StatelessWidget {
  const _ScrollButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.black.withValues(alpha: 0.7),
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
          tooltip: icon == Icons.chevron_left ? 'Scroll left' : 'Scroll right',
        ),
      );
}
