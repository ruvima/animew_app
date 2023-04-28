// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

@immutable
class AnimeEntity {
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
  const AnimeEntity({
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

  factory AnimeEntity.fromJson(Map<String, dynamic> json) {
    final scoreValue = json['score'];
    double score = 0.0;
    if (scoreValue != null && scoreValue is num) {
      score = scoreValue.toDouble();
    }

    final List<dynamic> genresJson = json['genres'];
    final List<Genres> genresList =
        genresJson.map((genre) => Genres.fromJson(genre)).toList();
    final List<dynamic> producersJson = json['producers'];
    final List<Producers> producersList =
        producersJson.map((producer) => Producers.fromJson(producer)).toList();

    final List<dynamic> licensorsJson = json['licensors'];
    final List<Licensors> licensorsList =
        licensorsJson.map((licensor) => Licensors.fromJson(licensor)).toList();

    final List<dynamic> studiosJson = json['studios'];
    final List<Studios> studiosList =
        studiosJson.map((studio) => Studios.fromJson(studio)).toList();
    return AnimeEntity(
      malId: json['mal_id'] ?? 0,
      imageUrl: json['images']['jpg']['image_url'] ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      source: json['source'] ?? '',
      episodes: json['episodes'] ?? 0,
      status: json['status'] ?? '',
      airing: json['airing'] ?? false,
      aired: json['aired']["string"] ?? '',
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      scoredBy: json['scored_by'] ?? 0,
      score: score,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      season: json['season'] ?? '',
      year: json['year'] ?? 0,
      producers: producersList,
      licensors: licensorsList,
      studios: studiosList,
      genres: genresList,
    );
  }
}

class Genres {
  final int malId;
  final String type;
  final String name;
  final String url;
  const Genres({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(
      malId: json['mal_id'] ?? 0,
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Genres(malId: $malId, type: $type, name: $name, url: $url)';
  }

  @override
  bool operator ==(covariant Genres other) {
    if (identical(this, other)) return true;

    return other.malId == malId &&
        other.type == type &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return malId.hashCode ^ type.hashCode ^ name.hashCode ^ url.hashCode;
  }
}

class Producers {
  final int malId;
  final String type;
  final String name;
  final String url;
  const Producers({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Producers.fromJson(Map<String, dynamic> json) {
    return Producers(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return 'Producers(malId: $malId, type: $type, name: $name, url: $url)';
  }

  @override
  bool operator ==(covariant Producers other) {
    if (identical(this, other)) return true;

    return other.malId == malId &&
        other.type == type &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return malId.hashCode ^ type.hashCode ^ name.hashCode ^ url.hashCode;
  }
}

class Licensors {
  final int malId;
  final String type;
  final String name;
  final String url;
  const Licensors({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Licensors.fromJson(Map<String, dynamic> json) {
    return Licensors(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  bool operator ==(covariant Licensors other) {
    if (identical(this, other)) return true;

    return other.malId == malId &&
        other.type == type &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return malId.hashCode ^ type.hashCode ^ name.hashCode ^ url.hashCode;
  }

  @override
  String toString() {
    return 'Licensors(malId: $malId, type: $type, name: $name, url: $url)';
  }
}

class Studios {
  final int malId;
  final String type;
  final String name;
  final String url;
  const Studios({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory Studios.fromJson(Map<String, dynamic> json) {
    return Studios(
      malId: json['mal_id'],
      type: json['type'],
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return 'Studios(malId: $malId, type: $type, name: $name, url: $url)';
  }

  @override
  bool operator ==(covariant Studios other) {
    if (identical(this, other)) return true;

    return other.malId == malId &&
        other.type == type &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return malId.hashCode ^ type.hashCode ^ name.hashCode ^ url.hashCode;
  }
}
