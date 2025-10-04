import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/service_locator.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_bloc.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_event.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(sl<MoviesBloc>().hashCode);

    return BlocProvider(
      create: (context) {
        return MoviesBloc(sl())..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc, MovieState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Movies')),
            body: const Center(child: Text('Movies Screen')),
          );
        },
      ),
    );
  }
}
