import 'package:flutter/material.dart';
import '../service/http_service.dart';
import 'movie_detail.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle title = GoogleFonts.lora();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.lora();

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F8FF),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Popular Movies",
          style: but.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Container(
            margin: EdgeInsets.only(top: 5, left: 7, right: 7),
            color: Colors.orange,
            child: InkWell(
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies[position]));
                Navigator.push(context, route);
              },
              child: Card(
                color: Colors.white,
                elevation: 9.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500' +
                              movies[position].posterPath,
                          height: 200,
                          width: 150,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Text(
                                movies[position].title,
                                style: body.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ),
                            Text(
                              movies[position].realeseDate.toString(),
                              style: title.copyWith(color: Colors.black),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Rating : ' +
                                    movies[position].voteAverage.toString(),
                                style: title.copyWith(color: Colors.black),
                              ),
                            ),
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      size: 20,
                                      color: (index <
                                              (movies[index].voteAverage / 2)
                                                  .floor())
                                          ? Color(0xffF8C25C)
                                          : Color(0xffF8F3E3)),
                                ),
                              ],
                            ),
                            RaisedButton(
                              color: Colors.green,
                              highlightColor: Colors.orange,
                              child: Text(
                                'Buy',
                                style: title,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
