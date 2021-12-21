// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, prefer_const_constructors, avoid_print
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  final String apiKey = "c2f1e49e";
  final String apiUrl = "https://www.omdbapi.com/?";

  Future<String> searchMoviesapiCall(String title,
      {required int tryingNum}) async {
    try {
      var url = Uri.parse('$apiUrl' + 's=' + title + "&apikey=$apiKey");
      print(url);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print('Error - ${e.toString()}');
      if (tryingNum < 3) {
        await Future.delayed(const Duration(seconds: 1), () {});
        return await searchMoviesapiCall(title, tryingNum: tryingNum + 1);
      }
      if (e is SocketException) {
        print('Error - ${e.toString()}');
      }
    }
    return "";
  }

  Future<String> searchbyImdbapiCall(String imdbID,
      {required int tryingNum}) async {
    try {
      var url = Uri.parse('$apiUrl' + 'i=' + imdbID + "&apikey=$apiKey");
      print(url);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print('Error - ${e.toString()}');
      if (tryingNum < 3) {
        await Future.delayed(const Duration(seconds: 1), () {});
        return await searchMoviesapiCall(imdbID, tryingNum: tryingNum + 1);
      }
      if (e is SocketException) {
        print('Error - ${e.toString()}');
      }
    }
    return "";
  }
}
