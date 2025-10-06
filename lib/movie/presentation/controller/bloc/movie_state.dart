import 'package:equatable/equatable.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MovieState({
    // this.nowPlayingMovies
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.isLoading,
    this.nowPlayingMessage = '',

    // this.popularMovies
    this.popularMovies = const [],
    this.popularState = RequestState.isLoading,
    this.popularMessage = '',

    // this.topRatedMovies
    this.topRatedMovies = const [],
    this.topRatedState = RequestState.isLoading,
    this.topRatedMessage = '',
  });

  // Make copyWith

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,

    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,

    List<Movie>? topRatedMovies,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularState,
    popularMessage,
    topRatedMovies,
    topRatedState,
    topRatedMessage,
  ];
}
