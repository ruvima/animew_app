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

    result.when(
      (success) => state = state.copyWith(
        topAnime: AsyncValue.data(success),
      ),
      (error) => state = state.copyWith(
        topAnime: AsyncValue.error(error, StackTrace.current),
      ),
    );
  }

  Future<void> getSeasonUpcoming() async {
    state = state.copyWith(seasonUpcoming: const AsyncValue.loading());
    final result = await _animeNavService.getSeasonUpcoming();

    result.when(
      (success) => state = state.copyWith(
        seasonUpcoming: AsyncValue.data(success),
      ),
      (error) => state = state.copyWith(
        seasonUpcoming: AsyncValue.error(error, StackTrace.current),
      ),
    );
  }

  Future<void> getSeasonNow() async {
    if (state.seasonNow.asData != null) {
      if (state.seasonNow.asData!.value.isEmpty) {
        state = state.copyWith(seasonNow: const AsyncValue.loading());
        final result = await _animeNavService.getSeasonNow();

        result.when(
          (success) => state = state.copyWith(
            seasonNow: AsyncValue.data(success),
          ),
          (error) => state = state.copyWith(
            seasonNow: AsyncValue.error(error, StackTrace.current),
          ),
        );
      }
    } else {
      try {
        state = state.copyWith(seasonNow: const AsyncValue.loading());
        final result = await _animeNavService.getSeasonNow();

        result.when(
          (success) => state = state.copyWith(
            seasonNow: AsyncValue.data(success),
          ),
          (error) => state = state.copyWith(
            seasonNow: AsyncValue.error(error, StackTrace.current),
          ),
        );
      } catch (e) {
        throw Exception('Failed to fetch data');
      }
    }
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
    }
  }
}
