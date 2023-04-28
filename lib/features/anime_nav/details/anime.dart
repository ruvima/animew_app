// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animew_app/features/anime_nav/details/anime_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class Anime {
  final int malId;
  final String imageUrl;
  final String title;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  final String aired; //
  final String duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int favorites;
  final String synopsis;
  final String season;
  final int year;
  final List<Producers> producers;
  final List<Licensors> licensors;
  final List<Studios> studios;
  final List<Genres> genres;
  const Anime({
    required this.malId,
    required this.imageUrl,
    required this.title,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.scoredBy,
    required this.score,
    required this.rank,
    required this.popularity,
    required this.favorites,
    required this.synopsis,
    required this.season,
    required this.year,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
  });

  String get genresCommaSeparated =>
      genres.map((e) => e.name).toList().join(', ');
  String get licensorsCommaSeparated =>
      licensors.map((e) => e.name).toList().join(', ');
  String get studiosCommaSeparated =>
      studios.map((e) => e.name).toList().join(', ');
  String get producersCommaSeparated =>
      producers.map((e) => e.name).toList().join(', ');

  factory Anime.fromEntity(AnimeEntity animeEntity) {
    return Anime(
      malId: animeEntity.malId,
      imageUrl: animeEntity.imageUrl,
      title: animeEntity.title,
      type: animeEntity.type,
      source: animeEntity.source,
      episodes: animeEntity.episodes,
      status: animeEntity.status,
      airing: animeEntity.airing,
      aired: animeEntity.aired,
      duration: animeEntity.duration,
      rating: animeEntity.rating,
      scoredBy: animeEntity.scoredBy,
      score: animeEntity.score,
      rank: animeEntity.rank,
      popularity: animeEntity.popularity,
      favorites: animeEntity.favorites,
      synopsis: animeEntity.synopsis,
      season: animeEntity.season,
      year: animeEntity.year,
      producers: animeEntity.producers,
      licensors: animeEntity.licensors,
      studios: animeEntity.studios,
      genres: animeEntity.genres,
    );
  }

  @override
  String toString() {
    return 'Anime(malId: $malId, imageUrl: $imageUrl, title: $title, type: $type, source: $source, episodes: $episodes, status: $status, airing: $airing, aired: $aired, duration: $duration, rating: $rating, score: $score, scoredBy: $scoredBy, rank: $rank, popularity: $popularity, favorites: $favorites, synopsis: $synopsis, season: $season, year: $year, producers: $producers, licensors: $licensors, studios: $studios, genres: $genres)';
  }

  @override
  bool operator ==(covariant Anime other) {
    if (identical(this, other)) return true;

    return other.malId == malId &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.type == type &&
        other.source == source &&
        other.episodes == episodes &&
        other.status == status &&
        other.airing == airing &&
        other.aired == aired &&
        other.duration == duration &&
        other.rating == rating &&
        other.score == score &&
        other.scoredBy == scoredBy &&
        other.rank == rank &&
        other.popularity == popularity &&
        other.favorites == favorites &&
        other.synopsis == synopsis &&
        other.season == season &&
        other.year == year &&
        listEquals(other.producers, producers) &&
        listEquals(other.licensors, licensors) &&
        listEquals(other.studios, studios) &&
        listEquals(other.genres, genres);
  }

  @override
  int get hashCode {
    return malId.hashCode ^
        imageUrl.hashCode ^
        title.hashCode ^
        type.hashCode ^
        source.hashCode ^
        episodes.hashCode ^
        status.hashCode ^
        airing.hashCode ^
        aired.hashCode ^
        duration.hashCode ^
        rating.hashCode ^
        score.hashCode ^
        scoredBy.hashCode ^
        rank.hashCode ^
        popularity.hashCode ^
        favorites.hashCode ^
        synopsis.hashCode ^
        season.hashCode ^
        year.hashCode ^
        producers.hashCode ^
        licensors.hashCode ^
        studios.hashCode ^
        genres.hashCode;
  }
}
