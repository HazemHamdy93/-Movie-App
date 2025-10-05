// movie/presentation/widgets/now_playing_movie_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constance.dart';

import '../../domain/entities/movie.dart';

class NowPlayingMovieItem extends StatelessWidget {
  final Movie movie;

  const NowPlayingMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('openMovieMinimalDetail'),
      onTap: () {
        // TODO: NAVIGATE TO MOVIE DETAILS
        _navigateToMovieDetails(context, movie);
      },
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0, 0.3, 0.5, 1],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              height: 560.0,
              imageUrl: ApiConstance.imageUrl(movie.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.redAccent,
                        size: 16.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        'Now Playing'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToMovieDetails(BuildContext context, Movie movie) {
    // Implement navigation logic here
    // Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetailsScreen(movie: movie)));
  }
}
