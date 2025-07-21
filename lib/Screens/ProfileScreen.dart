import 'package:flutter/material.dart';
import 'package:watchwise/Helper_Function/MyList.dart';
import 'package:watchwise/widgets/MovieCard.dart';

class Profilescreen extends StatefulWidget {
  @override
  State<Profilescreen> createState() => ProfilescreenState();
}

class ProfilescreenState extends State<Profilescreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Downloaded Movies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:
                  Mylist.downloadedMovies.isEmpty
                      ? Center(
                        child: Text(
                          "Your List is Empty, Download movies to create your own list",
                        ),
                      )
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Mylist.downloadedMovies.length,
                        itemBuilder:
                            (context, index) => Moviecard(
                              movieData: Mylist.downloadedMovies[index],
                            ),
                      ),
            ),
            Text(
              "My List",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:
                  Mylist.myList.isEmpty
                      ? Center(
                        child: Text(
                          "Your List is Empty, Add movies to create your own list",
                        ),
                      )
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Mylist.myList.length,
                        itemBuilder:
                            (context, index) =>
                                Moviecard(movieData: Mylist.myList[index]),
                      ),
            ),
            Text(
              "Rated Movies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child:
                  Mylist.ratedMovies.isEmpty
                      ? Center(child: Text("Your List is Empty"))
                      : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Mylist.ratedMovies.length,
                        itemBuilder:
                            (context, index) =>
                                Moviecard(movieData: Mylist.ratedMovies[index]),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
