// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/movie_short.dart';
import 'package:movieapp/themes/themedata.dart';

Widget movieCard(context, Movie movieSearched) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: FadeInImage(
                    fit: BoxFit.fitWidth,
                    image: CachedNetworkImageProvider(
                      movieSearched.imageUrl,
                    ),
                    placeholder: AssetImage('assets/loading3.gif'),
                    imageErrorBuilder: (c, o, s) =>
                        Image.asset('assets/loading3.gif'),
                    placeholderErrorBuilder: (c, o, s) =>
                        Image.asset('assets/loading3.gif'),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    color: Colors.black.withAlpha(150),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.star_rate_rounded),
                        Text("${movieSearched.imdbRating}/10"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              movieSearched.title,
              style: GoogleFonts.montserrat(color: whiteColor, fontSize: 20),
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.access_time_sharp,
                  color: Colors.amber,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${movieSearched.runTime}",
                  style:
                      GoogleFonts.montserrat(color: Colors.amber, fontSize: 15),
                ),
              ],
            )),
      ],
    ),
  );
}
