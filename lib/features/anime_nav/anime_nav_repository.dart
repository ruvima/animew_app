import 'dart:io';

import 'package:animew_app/core/failure.dart';
import 'package:animew_app/features/anime_nav/details/anime_entity.dart';
import 'package:animew_app/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animeRepositoryProvider = Provider<AnimeNavRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return JikanAnimeRepository(dio);
});

abstract class AnimeNavRepository {
  Future<List<AnimeEntity>> getTopAnime();
  Future<List<AnimeEntity>> getSeasonUpcoming();
  Future<List<AnimeEntity>> getSeasonNow();
}

class JikanAnimeRepository implements AnimeNavRepository {
  const JikanAnimeRepository(this.dio);
  final Dio dio;

  @override
  Future<List<AnimeEntity>> getTopAnime() async {
    try {
      final response = await dio.get(
        'top/anime',
        options: Options(
          receiveTimeout: const Duration(
            seconds: 5,
          ),
        ),
      );
      final result = List<Map<String, dynamic>>.from(response.data["data"]);
      final topAnime = result
          .map(
            (e) => AnimeEntity.fromJson(e),
          )
          .toList();
      return topAnime;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet conncection',
          exception: e,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Somenting went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<AnimeEntity>> getSeasonUpcoming() async {
    try {
      final response = await dio.get(
        'seasons/upcoming',
        options: Options(
          receiveTimeout: const Duration(
            seconds: 5,
          ),
        ),
      );
      final result = List<Map<String, dynamic>>.from(response.data["data"]);
      final seasonUpcomig = result
          .map(
            (e) => AnimeEntity.fromJson(e),
          )
          .toList();
      return seasonUpcomig;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet conncection',
          exception: e,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Somenting went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<AnimeEntity>> getSeasonNow() async {
    try {
      final response = await dio.get(
        'seasons/now',
        options: Options(
          receiveTimeout: const Duration(
            seconds: 5,
          ),
        ),
      );
      final result = List<Map<String, dynamic>>.from(response.data["data"]);
      final seasonNow = result
          .map(
            (e) => AnimeEntity.fromJson(e),
          )
          .toList();
      return seasonNow;
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw Failure(
          message: 'No internet conncection',
          exception: e,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Somenting went wrong',
        code: e.response?.statusCode,
      );
    }
  }
}
