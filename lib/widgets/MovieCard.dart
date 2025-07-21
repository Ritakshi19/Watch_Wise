import 'package:flutter/material.dart';
import 'package:watchwise/Model/Movies.dart';
import 'package:watchwise/Screens/DetailScreen.dart';

class Moviecard extends StatelessWidget {
  final Movies movieData;
  const Moviecard({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Detailscreen(movieData: movieData),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${movieData.poster_path}',
              height: 200,
              width: 120,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
