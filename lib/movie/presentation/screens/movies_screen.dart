import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/movie/data/database/base_movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repository/movies_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movie/domain/useCases/get_now_playing_movies_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMoviesRepository baseMoviesRepository = MoviesRepository(
      baseMovieRemoteDataSource,
    );
    final result = await GetNowPlayingMoviesUseCase(
      baseMoviesRepository,
    ).execute();
    log(result.toString());
  }
}
