import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_clean/movies/presentation/controller/movies_event.dart';
import 'package:movie_clean/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
            MoviesBloc()..add(GetNowPlayingMoviesEvent()),
        child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
          print(state);
          return const Scaffold();
        }));
  }
}
