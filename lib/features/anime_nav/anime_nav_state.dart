// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animew_app/features/anime_nav/details/anime.dart';
import 'package:flutter/foundation.dart';

@immutable
class AnimeNavState {
  final Anime anime;
  final List<Anime> bookmarks;
  final List<Anime> topAnime;
  const AnimeNavState({
    this.anime = animeMock,
    this.bookmarks = const [],
    this.topAnime = const [animeMock],
  });

  AnimeNavState copyWith({
    Anime? anime,
    List<Anime>? bookmarks,
  }) {
    return AnimeNavState(
      anime: anime ?? this.anime,
      bookmarks: bookmarks ?? this.bookmarks,
    );
  }

  @override
  String toString() => 'AnimeNavState(anime: $anime, bookmarks: $bookmarks)';

  @override
  bool operator ==(covariant AnimeNavState other) {
    if (identical(this, other)) return true;

    return other.anime == anime && listEquals(other.bookmarks, bookmarks);
  }

  @override
  int get hashCode => anime.hashCode ^ bookmarks.hashCode;
}
