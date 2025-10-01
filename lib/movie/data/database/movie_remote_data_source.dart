import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constance.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movie/data/models/movies_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlaying);
    if (response.statusCode == 200) {
      log(response.data.toString());
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popular);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRated);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromJson(e)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
