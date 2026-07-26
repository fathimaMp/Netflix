import 'package:flutter/material.dart';
import 'package:netflix_app/core/constanant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Used title variable here instead of hardcoded text
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(Icons.cast, color: Colors.white),
        kwidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kwidth,
      ],
    );
  }
}