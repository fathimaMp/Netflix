import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colours/colors.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});

  final List<String> imageList = [
    "https://image.tmdb.org/t/p/w500",
    "https://image.tmdb.org/t/p/w500",
    "https://image.tmdb.org/t/p/w500",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      
      BlocProvider.of<DownloadsBloc>(context).add(const DownloadsEvent.getDownloadsImage());
    },);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(title: "Downloads"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: const [
              Icon(Icons.settings, color: Kwhite),
              SizedBox(width: 10),
              Text("Smart Downloads", style: TextStyle(color: Kwhite, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            "Introducing Downloads for You",
            textAlign: TextAlign.center,
            style: TextStyle(color: Kwhite, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "We'll download a personalised selection of movies and shows for you, so there's always something to watch on your device.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 20),

          // Poster Stack Area
          SizedBox(
            width: size.width,
            height: size.width, // Square area for posters & circle background
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 1. Background Circle
                CircleAvatar(
                  radius: size.width * 0.38,
                  backgroundColor: Colors.grey.withValues(alpha: 0.2),
                ),

                // 2. Left Rotated Poster
                DownloadsImageWidget(
                  imageList: imageList[0],
                  angle: -20 * pi / 180,
                  margin: EdgeInsets.only(right: size.width * 0.35, bottom: 20),
                  size: size,
                ),

                // 3. Right Rotated Poster
                DownloadsImageWidget(
                  imageList: imageList[1],
                  angle: 20 * pi / 180,
                  margin: EdgeInsets.only(left: size.width * 0.35, bottom: 20),
                  size: size,
                ),

                // 4. Center Straight Poster
                DownloadsImageWidget(
                  imageList: imageList[2],
                  angle: 0,
                  margin: const EdgeInsets.only(bottom: 0),
                  size: size,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Buttons
          MaterialButton(
            color: KButtonColorBlue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set Up",
                style: TextStyle(color: Kwhite, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          MaterialButton(
            color: KButtonColorWhite,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See What You Can Download",
                style: TextStyle(color: KBlack, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Separate reusable widget for poster image with rotation
class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.angle,
    required this.margin,
    required this.size,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        width: size.width * 0.38,
        height: size.width * 0.52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}