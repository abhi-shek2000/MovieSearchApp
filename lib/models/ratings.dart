class MovieRatings {
  Map<String, String> ratings;

  MovieRatings(this.ratings);

  factory MovieRatings.fromJson(dynamic array) {
    Map<String, String> ratings = {};

    for (int i = 0; i < array.length; i++) {}

    return MovieRatings(ratings);
  }
}
