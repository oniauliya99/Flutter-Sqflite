import 'package:flutter/material.dart';
import 'package:pertemuan8/models/movie.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle title = GoogleFonts.lora();
TextStyle body = GoogleFonts.montserrat();
TextStyle but = GoogleFonts.lora();

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';
  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          movie.title,
          style: but.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                width: 800,
                child: Image.network(
                  path,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  'Overview',
                  style:
                      but.copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              Container(
                child: Text(movie.overview,
                    style: body.copyWith(color: Colors.black)),
                padding: EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
