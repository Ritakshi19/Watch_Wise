import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:watchwise/Helper_Function/MyList.dart';
import 'package:watchwise/Model/Movies.dart';
import 'package:watchwise/Screens/ProfileScreen.dart';
import 'package:watchwise/Services/MovieServices.dart';
import 'package:watchwise/widgets/MovieList.dart';

class Detailscreen extends StatefulWidget {
  final Movies movieData;
  const Detailscreen({super.key, required this.movieData});

  @override
  State<Detailscreen> createState() => DetailscreenState();
}

class DetailscreenState extends State<Detailscreen> {
  List<Movies> trendingMovies = [];
  bool isLoaded = false;
  bool isMyList = false;
  bool isRatedList = false;
  bool isDownloadedList = false;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  void getMovies() async {
    trendingMovies = (await MovieServices().getTrendingMovies())!;
    setState(() {
      isLoaded = true;
      isRatedList = Mylist.ratedMovies.contains(widget.movieData);
      isMyList = Mylist.myList.contains(widget.movieData);
      isDownloadedList = Mylist.downloadedMovies.contains(widget.movieData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movieData.poster_path}',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                widget.movieData.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              //SizedBox(height: 5,),
              Text(widget.movieData.release_date),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 46, 47, 48),
                ),
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white),
                    SizedBox(width: 5),
                    Center(
                      child: Text(
                        "Play",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              // SizedBox(height: 10,),
              ElevatedButton(
                onPressed: () {
                  Mylist.downloadMovies(widget.movieData, context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                  backgroundColor: const Color.fromARGB(255, 85, 91, 96),
                ),
                child: Row(
                  children: [
                    Icon(Icons.download, color: Colors.white),
                    SizedBox(width: 5),
                    Center(
                      child: Text(
                        "Download",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              ReadMoreText(
                widget.movieData.overview,
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: "Show More",
                trimExpandedText: "Show Less",
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 46, 47, 48),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Mylist.addToMyList(widget.movieData, context);
                    },
                    child: Column(children: [Icon(Icons.add), Text("My List")]),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 46, 47, 48),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      Mylist.ratedList(widget.movieData, context);
                    },
                    child: Column(
                      children: [Icon(Icons.thumb_up), Text("Rate")],
                    ),
                  ),
                  
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 46, 47, 48),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: Column(children: [Icon(Icons.send), Text("Share")]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              movieList("Trending Movies", trendingMovies),
            ],
          ),
        ),
      ),
    );
  }
}
