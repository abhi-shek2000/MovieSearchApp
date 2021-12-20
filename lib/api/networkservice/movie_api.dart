// ignore_for_file: public_member_api_docs, avoid_dynamic_calls, prefer_const_constructors, avoid_print
import 'dart:io';

import 'package:http/http.dart' as http;

class NetworkService {
  final String apiKey = "c2f1e49e";
  final String apiUrl = "https://www.omdbapi.com/?";

  Future<String> apiCall(String title, {required int tryingNum}) async {
    try {
      var url = Uri.parse('$apiUrl' + 't=' + title + "&apikey=$apiKey");
      print(url);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // return jsonDecode(response.body);
        return response.body;
      }
    } catch (e) {
      print('Error - ${e.toString()}');
      if (tryingNum < 3) {
        await Future.delayed(const Duration(seconds: 1), () {});
        return await apiCall(title, tryingNum: tryingNum + 1);
      }
      if (e is SocketException) {
        print('Error - ${e.toString()}');
      }
    }
    return "";
  }
}
