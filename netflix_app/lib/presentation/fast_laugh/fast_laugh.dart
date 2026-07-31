import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_items.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return VideoListItem(index: index);
          },
        ), 
      ),
    );
  }
}