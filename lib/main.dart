import 'package:animew_app/features/anime_nav/home/home_screen.dart';
import 'package:animew_app/theme/custom_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(baseUrl: 'https://api.jikan.moe/v4/'),
  ),
);

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
