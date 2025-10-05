// movie/presentation/widgets/popular_movies.dart
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movie/presentation/components/movies_horizontal_list.dart';

import '../../domain/entities/movie.dart';
 
class PopularMovies extends StatelessWidget {
  final List<Movie> movies;

  const PopularMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: "Popular",
          onSeeMore: () {
            // TODO: NAVIGATION TO POPULAR SCREEN
          },
        ),
        FadeIn(
          duration: const Duration(milliseconds: 500),
          child: MoviesHorizontalList(movies: movies),
        ),
      ],
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onSeeMore,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: onSeeMore,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'See More',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}