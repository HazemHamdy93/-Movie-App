import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/service_locator.dart';
import 'package:movie_app/movie/presentation/components/now_playing_movies.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_bloc.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
import 'package:movie_app/movie/presentation/screens/dummy.dart';

import 'package:movie_app/movie/presentation/components/popular_movies.dart';
import 'package:movie_app/movie/presentation/components/top_rated_movies.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent()),

      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Now Playing Section
              NowPlayingMovies(),
              // Popular Movies Section
              PopularMovies(),
              // Top Rated Movies Section
              TopRatedMovies(),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
