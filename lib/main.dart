import 'package:flutter/material.dart';
import 'package:movie_app/movie/data/database/base_movie_remote_data_source.dart';
import 'package:movie_app/movie/presentation/screens/movies_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MovieRemoteDataSource movieRemoteDataSource = MovieRemoteDataSource();
  movieRemoteDataSource.getNowPlayingMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MoviesScreen(),
    );
  }
}
