import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repsitory_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This repository provider is immutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDataSource());
});
