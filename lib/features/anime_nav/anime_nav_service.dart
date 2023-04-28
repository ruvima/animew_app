import 'package:animew_app/features/anime_nav/anime_nav_repository.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeServiceProvider = Provider<AnimeNavService>((ref) {
  final animeRepository = ref.watch(animeRepositoryProvider);
  return JikanAnimeService(animeRepository);
});

abstract class AnimeNavService {
  Future<List<Anime>> getTopAnime();
  Future<List<Anime>> getSeasonUpcoming();
  Future<List<Anime>> getRecentAnimeRecommendations();
  Future<List<Anime>> getSeasonNow();
}

class JikanAnimeService implements AnimeNavService {
  const JikanAnimeService(this._animeNavRepository);
  final AnimeNavRepository _animeNavRepository;

  @override
  Future<List<Anime>> getTopAnime() async {
    final animeEntitis = await _animeNavRepository.getTopAnime();
    final topAnime = animeEntitis
        .map(
          (e) => Anime.fromEntity(
            e,
          ),
        )
        .toList();
    return topAnime;
  }

  @override
  Future<List<Anime>> getSeasonUpcoming() async {
    final animeEntitis = await _animeNavRepository.getSeasonUpcoming();
    final seasonUpcoming = animeEntitis
        .map(
          (e) => Anime.fromEntity(
            e,
          ),
        )
        .toList();
    return seasonUpcoming;
  }

  @override
  Future<List<Anime>> getRecentAnimeRecommendations() async {
    final animeEntitis =
        await _animeNavRepository.getRecentAnimeRecommendations();
    final recentAnimeRecommendations = animeEntitis
        .map(
          (e) => Anime.fromEntity(
            e,
          ),
        )
        .toList();
    return recentAnimeRecommendations;
  }

  @override
  Future<List<Anime>> getSeasonNow() async {
    final animeEntitis = await _animeNavRepository.getSeasonNow();
    final seasonNow = animeEntitis
        .map(
          (e) => Anime.fromEntity(
            e,
          ),
        )
        .toList();
    return seasonNow;
  }
}
