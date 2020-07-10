import 'dart:convert';

import 'package:http/http.dart';
import 'package:newsapp/model/newsmodel.dart';

class Network {
  Future<newsmodel> getnewsforecast() async{
    var finalUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=31d25651f2d9430dafa1b2267bc037a9"; //change to metric or imperial

    final response = await get(Uri.encodeFull(finalUrl));
    print("URL: ${Uri.encodeFull(finalUrl)}");

    if (response.statusCode == 200) {
      // we get the actual mapped model ( dart object )
      print("weather data: ${response.body}");
      return newsmodel.fromJson(json.decode(response.body));
    }else {
      throw Exception("Error getting news forecast");
    }
  }
}