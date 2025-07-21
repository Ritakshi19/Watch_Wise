import 'package:flutter/material.dart';
import 'package:watchwise/Model/Movies.dart';
import 'package:watchwise/widgets/MovieCard.dart';

Widget movieList(String title, List<Movies> movies) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder:
                (context, index) => Moviecard(movieData: movies[index]),
          ),
        ),
        SizedBox(height: 5),
      ],
    ),
  );
}
