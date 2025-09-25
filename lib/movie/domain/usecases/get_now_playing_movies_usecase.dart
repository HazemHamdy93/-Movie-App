import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
