import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_bloc.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MoviesBloc()..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          print(state);
          return Scaffold(
            appBar: AppBar(title: const Text('Movies')),
            body: const Center(child: Text('Movies Screen')),
          );
        },
      ),
    );
  }
}
