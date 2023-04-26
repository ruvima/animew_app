import 'package:animew_app/features/anime_nav/home/home_screen.dart';
import 'package:animew_app/theme/custom_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AnimeW',
      darkTheme: CustomTheme.darkTheme(context),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
