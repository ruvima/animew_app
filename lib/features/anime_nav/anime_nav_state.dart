// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class AnimeNavState {
  final List<Anime> bookmarks;
  final AsyncValue<List<Anime>> topAnime;
  final AsyncValue<List<Anime>> seasonUpcoming;
  final AsyncValue<List<Anime>> recentAnimeRecommendations;
  final AsyncValue<List<Anime>> seasonNow;
  const AnimeNavState({
    required this.recentAnimeRecommendations,
    required this.seasonNow,
    required this.bookmarks,
    required this.topAnime,
    required this.seasonUpcoming,
  });

  @override
  String toString() {
    return 'AnimeNavState(bookmarks: $bookmarks, topAnime: $topAnime, seasonUpcoming: $seasonUpcoming, recentAnimeRecommendations: $recentAnimeRecommendations, seasonNow: $seasonNow)';
  }

  @override
  bool operator ==(covariant AnimeNavState other) {
    if (identical(this, other)) return true;

    return listEquals(other.bookmarks, bookmarks) &&
        other.topAnime == topAnime &&
        other.seasonUpcoming == seasonUpcoming &&
        other.recentAnimeRecommendations == recentAnimeRecommendations &&
        other.seasonNow == seasonNow;
  }

  @override
  int get hashCode {
    return bookmarks.hashCode ^
        topAnime.hashCode ^
        seasonUpcoming.hashCode ^
        recentAnimeRecommendations.hashCode ^
        seasonNow.hashCode;
  }

  AnimeNavState copyWith({
    List<Anime>? bookmarks,
    AsyncValue<List<Anime>>? topAnime,
    AsyncValue<List<Anime>>? seasonUpcoming,
    AsyncValue<List<Anime>>? recentAnimeRecommendations,
    AsyncValue<List<Anime>>? seasonNow,
  }) {
    return AnimeNavState(
      bookmarks: bookmarks ?? this.bookmarks,
      topAnime: topAnime ?? this.topAnime,
      seasonUpcoming: seasonUpcoming ?? this.seasonUpcoming,
      recentAnimeRecommendations:
          recentAnimeRecommendations ?? this.recentAnimeRecommendations,
      seasonNow: seasonNow ?? this.seasonNow,
    );
  }
}
