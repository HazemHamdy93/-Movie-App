//! Before Use Service Locator

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/core/enums.dart';
// import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';
// import 'package:movie_app/movie/domain/useCases/get_now_playing_movies_usecase.dart';
// import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
// import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';
// import '../../../data/database/base_movie_remote_data_source.dart';
// import '../../../data/repository/movies_repository.dart';
// class MoviesBloc extends Bloc<MovieEvent, MovieState> {
//   MoviesBloc() : super(const MovieState()) {
//     on<GetNowPlayingMoviesEvent>((event, emit) async {
//       // import UseCases Like GetNowPlayingMoviesUseCase
//       BaseMovieRemoteDataSource baseMovieRemoteDataSource =
//           MovieRemoteDataSource();
//       BaseMoviesRepository baseMoviesRepository = MoviesRepository(
//         baseMovieRemoteDataSource,
//       );
//       final result = await GetNowPlayingMoviesUseCase(
//         baseMoviesRepository,
//       ).execute();
//       emit(MovieState(nowPlayingState: RequestState.isLoaded));
//       result.fold(
//         (l) => MovieState(
//           nowPlayingState: RequestState.isError,
//           nowPlayingMessage: l.message,
//         ),
//         (r) => emit(
//           MovieState(
//             nowPlayingState: RequestState.isLoaded,
//             nowPlayingMovies: r,
//           ),
//         ),
//       );
//     });
//   }
// }

//! After Use Service Locator

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movie/domain/useCases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';

class MoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(MovieState(nowPlayingState: RequestState.isLoaded));
      result.fold(
        (l) => MovieState(
          nowPlayingState: RequestState.isError,
          nowPlayingMessage: l.message,
        ),
        (r) => emit(
          MovieState(
            nowPlayingState: RequestState.isLoaded,
            nowPlayingMovies: r,
          ),
        ),
      );
    });
  }
}
