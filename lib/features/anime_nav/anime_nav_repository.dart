import 'package:animew_app/features/anime_nav/details/anime_entity.dart';
import 'package:animew_app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeRepositoryProvider = Provider<AnimeNavRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return JikanAnimeRepository(dio);
});

abstract class AnimeNavRepository {
  Future<List<AnimeEntity>> getTopAnime();
  Future<List<AnimeEntity>> getSeasonUpcoming();
  Future<List<AnimeEntity>> getRecentAnimeRecommendations();
  Future<List<AnimeEntity>> getSeasonNow();
}

class JikanAnimeRepository implements AnimeNavRepository {
  const JikanAnimeRepository(this.dio);
  final Dio dio;

  @override
  Future<List<AnimeEntity>> getTopAnime() async {
    final response = await dio.get('top/anime');
    final result = List<Map<String, dynamic>>.from(response.data["data"]);
    final topAnime = result
        .map(
          (e) => AnimeEntity.fromJson(e),
        )
        .toList();
    return topAnime;
  }

  @override
  Future<List<AnimeEntity>> getSeasonUpcoming() async {
    final response = await dio.get('seasons/upcoming');
    final result = List<Map<String, dynamic>>.from(response.data["data"]);
    final seasonUpcomig = result
        .map(
          (e) => AnimeEntity.fromJson(e),
        )
        .toList();
    return seasonUpcomig;
  }

  @override
  Future<List<AnimeEntity>> getRecentAnimeRecommendations() async {
    final response = await dio.get('recommendations/anime');
    final result = List<Map<String, dynamic>>.from(response.data["data"]);
    final recentAnimeRecommendations = result
        .map(
          (e) => AnimeEntity.fromJson(e),
        )
        .toList();
    return recentAnimeRecommendations;
  }

  @override
  Future<List<AnimeEntity>> getSeasonNow() async {
    final response = await dio.get('seasons/now');
    final result = List<Map<String, dynamic>>.from(response.data["data"]);
    final seasonNow = result
        .map(
          (e) => AnimeEntity.fromJson(e),
        )
        .toList();
    return seasonNow;
  }
}
