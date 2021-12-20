// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:movieapp/api/networkservice/movie_api.dart';
import 'package:movieapp/themes/themedata.dart';
import 'package:movieapp/widgets/movie_widget.dart';

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
              movieCard(context),
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
    final NetworkService _netWork = NetworkService();
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
          print(await _netWork.getMovieDetails(text, tryingNum: 0));
        },
        // onChanged: onNameSearched,
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
              onTap: () {},
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

void onSearched(String text) {}
