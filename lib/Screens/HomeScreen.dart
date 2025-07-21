import 'package:flutter/material.dart';
import 'package:watchwise/Model/Movies.dart';
import 'package:watchwise/Screens/ProfileScreen.dart';
import 'package:watchwise/Services/MovieServices.dart';
import 'package:watchwise/widgets/MovieList.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  List<Movies>? popularMovies = [];
  List<Movies>? upcomingMovies = [];
  List<Movies>? nowPlayingMovies = [];
  List<Movies>? topRatedMovies = [];

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    popularMovies = await MovieServices().getPopularMovies();
    upcomingMovies = await MovieServices().getUpcomingMovies();
    nowPlayingMovies = await MovieServices().getNowPlayingMovies();
    topRatedMovies = await MovieServices().getTopRatedMovies();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              iconSize: 40,
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profilescreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            movieList("Popular Movies", popularMovies!),
            movieList("Upcoming Movies", upcomingMovies!),
            movieList("Now Playing Movies", nowPlayingMovies!),
            movieList("Top Rated Movies", topRatedMovies!),
          ],
        ),
      ),
    );
  }
}
