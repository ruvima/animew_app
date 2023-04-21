import 'package:flutter/material.dart';

class AnimeNav extends StatelessWidget {
  const AnimeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
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
      // onTap: (value) {
      //   switch (value) {
      //     case 0:
      //       break;
      //     default:
      //   }
      // },
    );
  }
}
