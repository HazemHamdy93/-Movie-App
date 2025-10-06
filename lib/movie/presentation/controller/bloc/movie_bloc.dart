import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movie/domain/useCases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/domain/useCases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/useCases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';

class MoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MovieState()) {
    // 🔹 Now Playing
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            nowPlayingState: RequestState.isError,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingState: RequestState.isLoaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });

    // 🔹 Popular
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            popularState: RequestState.isError,
            popularMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(popularState: RequestState.isLoaded, popularMovies: r),
        ),
      );
    });

    // 🔹 Top Rated
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedState: RequestState.isError,
            topRatedMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedState: RequestState.isLoaded,
            topRatedMovies: r,
          ),
        ),
      );
    });
  }
}
