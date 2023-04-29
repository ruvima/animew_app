import 'package:animew_app/core/failure.dart';
import 'package:animew_app/features/anime_nav/anime_nav_repository.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

final animeServiceProvider = Provider<AnimeNavService>((ref) {
  final animeRepository = ref.watch(animeRepositoryProvider);
  return JikanAnimeService(animeRepository);
});

abstract class AnimeNavService {
  Future<Result<List<Anime>, Failure>> getTopAnime();
  Future<Result<List<Anime>, Failure>> getSeasonUpcoming();
  Future<Result<List<Anime>, Failure>> getSeasonNow();
}

class JikanAnimeService implements AnimeNavService {
  const JikanAnimeService(this._animeNavRepository);
  final AnimeNavRepository _animeNavRepository;

  @override
  Future<Result<List<Anime>, Failure>> getTopAnime() async {
    try {
      final animeEntitis = await _animeNavRepository.getTopAnime();
      final topAnime = animeEntitis
          .map(
            (e) => Anime.fromEntity(
              e,
            ),
          )
          .toList();
      return Success(topAnime);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  @override
  Future<Result<List<Anime>, Failure>> getSeasonUpcoming() async {
    try {
      final animeEntitis = await _animeNavRepository.getSeasonUpcoming();
      final seasonUpcoming = animeEntitis
          .map(
            (e) => Anime.fromEntity(
              e,
            ),
          )
          .toList();
      return Success(seasonUpcoming);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }

  @override
  Future<Result<List<Anime>, Failure>> getSeasonNow() async {
    try {
      final animeEntitis = await _animeNavRepository.getSeasonNow();
      final seasonNow = animeEntitis
          .map(
            (e) => Anime.fromEntity(
              e,
            ),
          )
          .toList();
      return Success(seasonNow);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
