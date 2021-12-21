// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movieapp/bloc/searchmovie_bloc.dart';
import 'package:movieapp/pages/search_page.dart';
import 'package:movieapp/themes/themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      home: BlocProvider(
        create: (context) => SearchmovieBloc(),
        child: SearchPage(),
      ),
    );
  }
}
