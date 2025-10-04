import 'package:equatable/equatable.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movie/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.isLoading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
  ];
}
