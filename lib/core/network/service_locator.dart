import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/repository/movies_repository.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movie/domain/useCases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_bloc.dart';

import '../../movie/data/database/base_movie_remote_data_source.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // * BloC
    sl.registerFactory(() => MoviesBloc(sl()));

    //* Use Cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    //* Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );

    //* Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
