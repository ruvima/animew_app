import 'package:animew_app/features/anime_nav/anime_nav_service.dart';
import 'package:animew_app/features/anime_nav/anime_nav_state.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeNavControllerProvider =
    StateNotifierProvider<AnimeNavController, AnimeNavState>(
  (ref) => AnimeNavController(
    const AnimeNavState(
      topAnime: AsyncValue.data([]),
      seasonUpcoming: AsyncValue.data([]),
      recentAnimeRecommendations: AsyncValue.data([]),
      seasonNow: AsyncValue.data([]),
      bookmarks: [],
    ),
    ref.watch(animeServiceProvider),
  ),
);

class AnimeNavController extends StateNotifier<AnimeNavState> {
  AnimeNavController(AnimeNavState state, this._animeNavService)
      : super(state) {
    getTopAnime();
    getSeasonUpcoming();
  }
  final AnimeNavService _animeNavService;

  Future<void> getTopAnime() async {
    state = state.copyWith(topAnime: const AsyncValue.loading());
    final result = await _animeNavService.getTopAnime();

    state = state.copyWith(topAnime: AsyncValue.data(result));
  }

  Future<void> getSeasonUpcoming() async {
    state = state.copyWith(seasonUpcoming: const AsyncValue.loading());
    final result = await _animeNavService.getSeasonUpcoming();

    state = state.copyWith(seasonUpcoming: AsyncValue.data(result));
  }

  Future<void> getRecentAnimeRecommendations() async {
    state =
        state.copyWith(recentAnimeRecommendations: const AsyncValue.loading());
    final result = await _animeNavService.getRecentAnimeRecommendations();

    state = state.copyWith(recentAnimeRecommendations: AsyncValue.data(result));
  }

  Future<void> getSeasonNow() async {
    state = state.copyWith(seasonNow: const AsyncValue.loading());
    final result = await _animeNavService.getSeasonNow();

    state = state.copyWith(seasonNow: AsyncValue.data(result));
  }

  void toggleBookMark(Anime anime) {
    if (!state.bookmarks.contains(anime)) {
      List<Anime> newList = state.bookmarks;
      newList = [...newList, anime];

      state = state.copyWith(
        bookmarks: newList,
      );
    } else {
      final newList = state.bookmarks;
      newList.removeWhere((element) => element == anime);
      state = state.copyWith(bookmarks: newList);
      print(state.bookmarks.length);
    }
  }
}
