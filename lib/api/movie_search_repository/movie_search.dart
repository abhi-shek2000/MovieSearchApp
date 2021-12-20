import 'dart:convert';

import 'package:movieapp/api/networkservice/movie_api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/ratings.dart';

class MovieSearch {
  final NetworkService _networkService = NetworkService();

  Future<Movie> searchMovie(String title) async {
    var rawResponse;
    rawResponse = await _networkService.apiCall(title, tryingNum: 0);

    final response = jsonDecode(rawResponse);
    if (response["Response"] == "False") throw "Not Found";
    return Movie.fromJson(response);
  }
}
