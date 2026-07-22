import 'package:flutter/material.dart';
import 'package:netflix_app/core/colours/colors.dart';
import 'package:netflix_app/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_navigation/bottom_nav.dart';
import 'package:netflix_app/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_app/presentation/search/search.dart';

class ScreenMainPage extends StatelessWidget {
   ScreenMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier, 
          builder: (conxt, int index,_){
            return _pages[index];
          },
          ),
      ),
        bottomNavigationBar : BottomNavigationWidget(),
    );
  }
}