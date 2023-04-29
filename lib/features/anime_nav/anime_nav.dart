import 'package:animew_app/features/anime_nav/bookmark/bookmark_screen.dart';
import 'package:animew_app/features/anime_nav/explore/explore_screen.dart';
import 'package:animew_app/features/anime_nav/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeNav extends StatefulWidget {
  const AnimeNav({Key? key}) : super(key: key);

  @override
  State<AnimeNav> createState() => _AnimeNavState();
}

int currentIndex = 0;

class _AnimeNavState extends State<AnimeNav> {
  @override
  Widget build(BuildContext context) {
    void updateIndex(int value) {
      setState(() {
        currentIndex = value;
      });
    }

    return Consumer(builder: (context, ref, child) {
      return BottomNavigationBar(
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
        onTap: (value) {
          switch (value) {
            case 0:
              if (currentIndex != 0) {
                updateIndex(value);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
              break;
            case 1:
              break;
            case 2:
              if (currentIndex != 2) {
                updateIndex(value);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExploreScreen(),
                  ),
                );
              }
              break;
            case 3:
              if (currentIndex != 3) {
                updateIndex(value);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BookmarkScreen(),
                  ),
                );
              }
              break;
            default:
          }
        },
      );
    });
  }
}
