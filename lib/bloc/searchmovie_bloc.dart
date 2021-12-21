// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movieapp/api/movie_search_repository/movie_search.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_short.dart';

part 'searchmovie_event.dart';
part 'searchmovie_state.dart';

class SearchmovieBloc extends Bloc<SearchmovieEvent, SearchmovieState> {
  SearchmovieBloc() : super(SearchmovieInitials()) {
    on<SearchButtonPressed>((event, emit) async {
      // TODO: implement event handler
      emit(MovieSearching());
      await fetchMovies(emit, event.title);
    });
    on<SearchClearedEvent>((event, emit) => {emit(SearchmovieInitials())});
  }
}

Future<void> fetchMovies(Emitter<SearchmovieState> emit, String title) async {
  final MovieSearch _movieSearch = MovieSearch();
  try {
    final _movie = await _movieSearch.searchMovie(title);
    emit(MoviesLoaded(_movie));
  } catch (e) {
    print(e.toString());
    emit(MovieNotFound());
  }
}
