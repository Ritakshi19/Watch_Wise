class Movies {
  String title;
  String poster_path;
  String release_date;
  String overview;

  Movies({
    required this.title,
    required this.poster_path,
    required this.release_date,
    required this.overview,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    poster_path: json["poster_path"],
    title: json["title"],
    release_date: json["release_date"],
    overview: json["overview"],
  );
  Map<String, dynamic> toJson() => {
    "poster_path": poster_path,
    "title": title,
    "release_date": release_date,
    "overview" : overview,
  };
}
