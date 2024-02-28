import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
* We created a new memory container for all the films that will be
* toggled as Favorites and allow us build it in the Favorite's page
* */

final favoritesMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

/*
*  State looks like the following
* {
*   1234: Movie,
*   1645: Movie,
*   6523: Movie,
* }
* */

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  int page = 0;
  final LocalStorageRepository localStorageRepository;

  // Load next page of films
  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final tempMoviesMap = <int, Movie>{};

    // update the state
    // movies is a list,, not a map, so we need the shape of the state
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
