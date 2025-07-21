import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchwise/Model/Movies.dart';

class MovieServices {
  static final String baseUrl = 'https://api.themoviedb.org/3';
  static final String apiKey = 'c264d21c36961c6aacbf2198740e8c88';

  Future<List<Movies>?> getPopularMovies() async {
    var client = http.Client();
    var url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      return (data['results'] as List)
          .map((json) => Movies.fromJson(json))
          .toList();
    } else {
      print("Failed  to return movies");
    }
  }

  Future<List<Movies>?> getUpcomingMovies() async {
    var client = http.Client();
    var url = Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      return (data['results'] as List)
          .map((json) => Movies.fromJson(json))
          .toList();
    }
  }

  Future<List<Movies>?> getNowPlayingMovies() async {
    var client = http.Client();
    var url = Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      return (data['results'] as List)
          .map((json) => Movies.fromJson(json))
          .toList();
    }
  }

  Future<List<Movies>?> getTopRatedMovies() async {
    var client = http.Client();
    var url = Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      return (data['results'] as List)
          .map((json) => Movies.fromJson(json))
          .toList();
    }
  }

  Future<List<Movies>?> getTrendingMovies() async {
    var client = http.Client();
    var url = Uri.parse('$baseUrl/trending/movie/day?api_key=$apiKey');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print(response.body);
      return (data['results'] as List)
          .map((json) => Movies.fromJson(json))
          .toList();
    }
  }
}
