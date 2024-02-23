import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/screens/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return const FullScreenLoader();

    // Obtain the values of the provider.
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies= ref.watch(topRatedMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // const CustomAppbar(),
              MoviesSlideShow(movies: slideShowMovies),
              MovieHorizontalListview(
                title: 'In Cinemas',
                subTitle: 'Monday 20',
                movies: nowPlayingMovies,
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                title: 'Upcoming',
                subTitle: 'This Month!',
                movies: upcomingMovies,
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                title: 'Popular',
                movies: popularMovies,
                loadNextPage: () =>
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                title: 'Top Rated',
                subTitle: 'All Time',
                movies: topRatedMovies,
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              const SizedBox(
                height: 10,
              )
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: nowPlayingMovies.length,
              //     itemBuilder: (context, index) {
              //       final movie = nowPlayingMovies[index];+
              //       return ListTile(
              //         title: Text(movie.title),
              //       );
              //   },),
              // ),
            ],
          );
        }, childCount: 1),
      ),
    ]);
  }
}
