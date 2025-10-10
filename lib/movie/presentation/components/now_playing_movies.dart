// movie/presentation/widgets/now_playing_movies.dart
import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movie/presentation/components/now_playing_movie_item.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';

import '../controller/bloc/movie_bloc.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.nowPlayingState != current.nowPlayingState,
      builder: (context, state) {
        switch (state.nowPlayingState) {
          case RequestState.isLoading:
            return const Center(
              child: SizedBox(
                height: 360,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          case RequestState.isLoaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 360.0,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {},
                ),
                items: state.nowPlayingMovies.map((movie) {
                  return NowPlayingMovieItem(movie: movie);
                }).toList(),
              ),
            );
          case RequestState.isError:
            return Center(child: Text(state.nowPlayingMessage));
        }
      },
    );
  }
}
