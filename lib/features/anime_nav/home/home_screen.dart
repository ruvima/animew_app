import 'package:animew_app/features/anime_nav/anime_nav.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
      bottomNavigationBar: const AnimeNav(),
    );
  }
}
