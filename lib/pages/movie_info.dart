// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/themes/themedata.dart';

class MovieInfo extends StatelessWidget {
  Movie movieDetails;
  MovieInfo({Key? key, required this.movieDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: <Widget>[
              Container(
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movieDetails.imageUrl),
                  ),
                ),
              ),
              Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent.withOpacity(0.0),
                          backGround
                        ],
                        stops: [
                          0.0,
                          1.0
                        ])),
              ),
              Positioned(
                left: 15,
                right: 15,
                bottom: 150,
                child: Column(
                  children: [
                    Container(
                      width: 500,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              movieDetails.title,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 35),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 500,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              movieDetails.genre,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white.withAlpha(200),
                                  fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/download.png',
                      width: 25,
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/Path.png',
                      width: 25,
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      'assets/download.png',
                      width: 25,
                      height: 25,
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    movieRatings(
                        "Internet Movie Database",
                        movieDetails
                                .ratings.ratings["Internet Movie Database"] ??
                            "NA"),
                    movieRatings(
                        "Rotten Tomatoes",
                        movieDetails.ratings.ratings["Rotten Tomatoes"] ??
                            "NA"),
                    movieRatings("Metacritic",
                        movieDetails.ratings.ratings["Metacritic"] ?? "NA"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              'assets/Group 357.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            movieDetails.year,
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              'assets/Vector.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            movieDetails.country,
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              'assets/Group 356.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            movieDetails.runTime,
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Image.asset(
                              'assets/Group 358.png',
                              width: 25,
                              height: 25,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              movieDetails.language,
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20, right: 20, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Text(
                        "Plot",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15.0, left: 15, right: 15),
                      child: Text(
                        "\"${movieDetails.plot}\"",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Text(
                        "Actors",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    getNames(movieDetails.actors),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      child: Text(
                        "Writer",
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                    getNames(movieDetails.writer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget movieRatings(String ratingName, String ratings) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            ratingName,
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
          ),
        ),
        Text(
          ratings,
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 18),
        ),
      ],
    ),
  );
}

Widget getNames(String names) {
  List<String> listOfNames = names.split(",");
  List<Widget> nameWidgets = [];
  for (var each in listOfNames) {
    nameWidgets.add(
      Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF37274b),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Text(
            each,
            style: GoogleFonts.montserrat(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
  return Wrap(
    spacing: 3.0,
    children: nameWidgets,
  );
}
