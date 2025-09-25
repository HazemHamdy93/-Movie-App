import 'package:movie_app/movie/domain/entities/movie.dart';
import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  Future<List<Movie>> execute() async {
    return await baseMoviesRepository.getPopularMovies();
  }
}
