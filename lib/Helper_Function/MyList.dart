import 'package:flutter/material.dart';
import 'package:watchwise/Model/Movies.dart';

class Mylist {
  static List<Movies> myList = [];
  static List<Movies> ratedMovies = [];
  static List<Movies> downloadedMovies = [];

  static void addToMyList(Movies movie, BuildContext context) {
    if (!myList.contains(movie)) {
      myList.add(movie);
      showSnackBar(context, "Movie Added Successfully to My List !!");
    }
  }

  static void ratedList(Movies movie, BuildContext context) {
    if (!ratedMovies.contains(movie)) {
      ratedMovies.add(movie);
      showSnackBar(context, "Movie Rated Successfully !!");
    }
  }

  static void downloadMovies(Movies movie, BuildContext context) {
    if (!downloadedMovies.contains(movie)) {
      downloadedMovies.add(movie);
      showSnackBar(context, "Movie Downloaded Successfully !!");
    }
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
