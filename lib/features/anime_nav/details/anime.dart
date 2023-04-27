// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

const animeMock = Anime(
  malId: 16498,
  imageUrl: "https://cdn.myanimelist.net/images/anime/10/47347.jpg",
  title: 'Shingeki no Kyojin',
  type: 'TV',
  source: 'Manga',
  episodes: 75,
  status: 'Finished Airing',
  airing: false,
  aired: 'Apr 7, 2013 to Mar 29, 2021',
  duration: '24 min per ep',
  rating: 'R - 17+ (violence & profanity)',
  scoredBy: 117334,
  score: 8.51,
  rank: 47,
  popularity: 9,
  favorites: 123053,
  synopsis:
      'Centuries ago, mankind was slaughtered to near extinction by monstrous humanoid creatures called titans, forcing humans to hide in fear behind enormous concentric walls. What makes these giants truly terrifying is that their taste for human flesh is not born out of hunger but what appears to be out of pleasure.',
  season: 'Spring 2013',
  year: 2013,
  producers: [
    Producers(
      malId: 21,
      type: 'animation production',
      name: 'Production I.G',
      url: 'https://myanimelist.net/anime/producer/21/Production_I_G',
    ),
    Producers(
      malId: 13,
      type: 'animation production',
      name: 'Wit Studio',
      url: 'https://myanimelist.net/anime/producer/13/Wit_Studio',
    ),
  ],
  licensors: [
    Licensors(
      malId: 4,
      type: 'North American',
      name: 'Funimation',
      url: 'https://myanimelist.net/anime/producer/4/Funimation',
    ),
  ],
  studios: [
    Studios(
      malId: 13,
      type: 'animation production',
      name: 'Wit Studio',
      url: 'https://myanimelist.net/anime/producer/13/Wit_Studio',
    ),
  ],
  genres: [
    Genres(
      malId: 1,
      type: 'anime',
      name: 'Action',
      url: 'https://myanimelist.net/anime/genre/1/Action',
    ),
    Genres(
      malId: 2,
      type: 'anime',
      name: 'Military',
      url: 'https://myanimelist.net/anime/genre/2/Military',
    ),
    Genres(
      malId: 10,
      type: 'anime',
      name: 'Mystery',
      url: 'https://myanimelist.net/anime/genre/10/Mystery',
    ),
    Genres(
      malId: 22,
      type: 'anime',
      name: 'Super Power',
      url: 'https://myanimelist.net/anime/genre/22/Super_Power',
    ),
    Genres(
      malId: 24,
      type: 'anime',
      name: 'Drama',
      url: 'https://myanimelist.net/anime/genre/24/Drama',
    ),
  ],
);

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

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'] ?? 0,
      imageUrl: json['image_url']['jpg']['image_url'] ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      source: json['source'] ?? '',
      episodes: json['episodes'] ?? 0,
      status: json['status'] ?? '',
      airing: json['airing'] ?? false,
      aired: json['aired'] ?? '',
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      scoredBy: json['scored_by'] ?? 0,
      score: json['score'] ?? 0,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      season: json['season'] ?? '',
      year: json['year'],
      producers: List.from(json['producers']),
      licensors: List.from(json['licensors']),
      studios: List.from(json['studios']),
      genres: List.from(json['genres']),
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
}
