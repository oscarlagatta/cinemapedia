import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {

  Future<void> toggleFavorite(Movie movie);

  Future<void> isMovieFavorite(int movieId);

  Future<List<Movie>> loadMovies({ int limit = 10, offset = 0});
}