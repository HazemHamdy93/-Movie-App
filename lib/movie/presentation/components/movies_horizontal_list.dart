// movie/presentation/widgets/movies_horizontal_list.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movie_app/core/constants/api_constance.dart';
 
import '../../domain/entities/movie.dart';

class MoviesHorizontalList extends StatelessWidget {
  final List<Movie> movies;

  const MoviesHorizontalList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieHorizontalItem(movie: movie);
        },
      ),
    );
  }
}

class MovieHorizontalItem extends StatelessWidget {
  final Movie movie;

  const MovieHorizontalItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          // TODO: NAVIGATE TO MOVIE DETAILS
          _navigateToMovieDetails(context, movie);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: 120.0,
            fit: BoxFit.cover,
            imageUrl: ApiConstance.imageUrl(movie.backdropPath),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[850]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 170.0,
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  void _navigateToMovieDetails(BuildContext context, Movie movie) {
    // Implement navigation logic here
    // Navigator.push(context, MaterialPageRoute(builder: (_) => MovieDetailsScreen(movie: movie)));
  }
}