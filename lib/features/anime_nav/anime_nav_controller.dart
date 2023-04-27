import 'package:animew_app/features/anime_nav/anime_nav_state.dart';
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeNavControllerProvider =
    StateNotifierProvider<AnimeNavController, AnimeNavState>(
        (_) => AnimeNavController(
              const AnimeNavState(),
            ));

class AnimeNavController extends StateNotifier<AnimeNavState> {
  AnimeNavController(AnimeNavState state) : super(state);

  void toggleBookMark(Anime anime) {
    if (!state.bookmarks.contains(anime)) {
      state = state.copyWith(
        bookmarks: [...state.bookmarks, anime],
      );
      print(state.bookmarks.length);
    } else {
      final newList = state.bookmarks;
      newList.removeWhere((element) => element == anime);
      state = state.copyWith(bookmarks: newList);
      print(state.bookmarks.length);
    }
  }
}
