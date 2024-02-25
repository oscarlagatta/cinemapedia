import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});
/*
    State
 {
    '505642': Movie(),
    '505643': Movie(),
    '505644': Movie(),
 }
* */

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  MovieMapNotifier({required this.getMovie}) : super({}); // init with empty Map

  final GetMovieCallback getMovie;

  Future<void> loadMovie(String movieId) async {
    // if the movie exists we do nothing
    if (state[movieId] != null) return;

    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
