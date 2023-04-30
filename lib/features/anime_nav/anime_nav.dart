import 'package:animew_app/core/widgets/custom_willpop_scope.dart';
import 'package:animew_app/features/anime_nav/bookmark/bookmark_screen.dart';
import 'package:animew_app/features/anime_nav/explore/explore_screen.dart';
import 'package:animew_app/features/anime_nav/home/home_screen.dart';
import 'package:flutter/material.dart';

class AnimeNav extends StatefulWidget {
  const AnimeNav({Key? key}) : super(key: key);

  @override
  State<AnimeNav> createState() => _AnimeNavState();
}

int currentIndex = 0;

class _AnimeNavState extends State<AnimeNav> {
  void updateIndex(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  final screenList = <Widget>[
    const HomeScreen(),
    const Center(
      child: Text('Not implemented'),
    ),
    const ExploreScreen(),
    const BookmarkScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return CustomWillpopScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AnimeW'),
        ),
        body: screenList.elementAt(currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'History',
              icon: Icon(Icons.history),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(Icons.explore),
            ),
            BottomNavigationBarItem(
              label: 'Bookmark',
              icon: Icon(Icons.bookmark),
            ),
          ],
          onTap: (value) => updateIndex(value),
        ),
      ),
    );
  }
}
