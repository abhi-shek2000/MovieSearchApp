// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, curly_braces_in_flow_control_structures, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movieapp/api/networkservice/movie_api.dart';
import 'package:movieapp/bloc/searchmovie_bloc.dart';
import 'package:movieapp/themes/themedata.dart';
import 'package:movieapp/widgets/movie_widget.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController searchTextController;

  @override
  initState() {
    super.initState();
    searchTextController = TextEditingController();
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              buildSearchBar(),
              BlocBuilder<SearchmovieBloc, SearchmovieState>(
                builder: (context, state) {
                  if (state is MovieSearching)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  if (state is MoviesLoaded)
                    return movieCard(context, state.movieSearched);

                  if (state is MovieNotFound)
                    return Container(
                        child: Center(
                      child: Text(
                        "Movie Not Found",
                        style: TextStyle(color: whiteColor, fontSize: 20),
                      ),
                    ));
                  return Container(
                    child: Center(
                      child: Text("Search Movies"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget backgroudImage() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: backGround),
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bgbloop.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    final inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: whiteColor,
      ),
      borderRadius: BorderRadius.circular(15),
    );
    return Padding(
      padding: EdgeInsets.only(top: 70, bottom: 10, left: 20, right: 20),
      child: TextField(
        controller: searchTextController,
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.name,
        style: TextStyle(color: Colors.white.withOpacity(0.8)),
        onSubmitted: (text) async {
          BlocProvider.of<SearchmovieBloc>(context)
              .add(SearchButtonPressed(text));
        },
        autofocus: true,
        decoration: InputDecoration(
            fillColor: Color(0xFF453954),
            contentPadding: EdgeInsets.all(0),
            isDense: true,
            filled: true,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            hintText: "Search by name",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Image.asset(
                'assets/Frame.png',
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                searchTextController.clear();
                BlocProvider.of<SearchmovieBloc>(context)
                    .add(SearchClearedEvent());
              },
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Image.asset(
                  'assets/Group 220.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.fill,
                ),
              ),
            )),
      ),
    );
  }
}
