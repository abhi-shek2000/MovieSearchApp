part of 'searchmovie_bloc.dart';

@immutable
abstract class SearchmovieEvent {}

class SearchButtonPressed extends SearchmovieEvent {
  String title;
  SearchButtonPressed(this.title);
}

class SearchClearedEvent extends SearchmovieEvent {}

class SearchMovieNotFound extends SearchmovieEvent {}
