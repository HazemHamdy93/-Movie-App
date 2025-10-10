// movie/presentation/widgets/popular_movies.dart
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/api_constance.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/movie/presentation/components/custom_header.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_bloc.dart';
import 'package:movie_app/movie/presentation/controller/bloc/movie_state.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeader(title: 'Popular', subTitle: 'See All'),

        BlocBuilder<MoviesBloc, MovieState>(
          buildWhen: (previous, current) =>
              previous.popularState != current.popularState,
          builder: (context, state) {
            switch (state.popularState) {
              case RequestState.isLoading:
                return const Center(
                  child: SizedBox(
                    height: 360,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                );
              case RequestState.isLoaded:
                return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 170.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.popularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.popularMovies[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {},
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              child: CachedNetworkImage(
                                width: 120.0,
                                fit: BoxFit.cover,
                                imageUrl: ApiConstance.imageUrl(
                                  movie.backdropPath,
                                ),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              case RequestState.isError:
                return Center(child: Text(state.popularMessage));
            }
          },
        ),
      ],
    );
  }
}
