import 'package:cinemapedia/domain/entities/movie.dart';

// API Key: 11bedc47682621bc897dee14dfee40ce
// API read access token: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMWJlZGM0NzY4MjYyMWJjODk3ZGVlMTRkZmVlNDBjZSIsInN1YiI6IjY1ZDVlZDdlNWFkNzZiMDE3Yzc0NTcxMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.T3_W6pxjI1UPaj3osFG-6n_d1GySezG8DDheM9F5OCU

// API request: https://api.themoviedb.org/3/movie/550?api_key=11bedc47682621bc897dee14dfee40ce
abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
}
