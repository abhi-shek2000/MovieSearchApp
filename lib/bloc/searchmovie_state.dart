// ignore_for_file: must_be_immutable

part of 'searchmovie_bloc.dart';

@immutable
abstract class SearchmovieState {}

class SearchmovieInitials extends SearchmovieState {}

class MovieSearching extends SearchmovieState {}

class MoviesLoaded extends SearchmovieState {
  List<MovieInShort> movieSearched;
  MoviesLoaded(this.movieSearched);
}

class MovieNotFound extends SearchmovieState {}
