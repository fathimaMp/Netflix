import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app/presentation/search/widgets/search_result.dart'; // Make sure this file exists

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  // Track search query state
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Dark background for Netflix theme
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.3),
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 15),
              
              // Dynamic view switching
              Expanded(
                child: _searchQuery.isEmpty
                    ? const SearchIdleWidgets()   // Top Searches (List View)
                    : const SearchResultWidget(), // Movies & TV (Grid View)
              ),
            ],
          ),
        ),
      ),
    );
  }
}