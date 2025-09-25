import 'package:movie_app/movie/domain/repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future execute() async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
