import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';
import 'package:sample/presentation/movie_detail/widgets/backdrop_rating.dart';
import 'package:sample/presentation/movie_detail/widgets/genres.dart';
import 'package:sample/presentation/movie_detail/widgets/movie_info.dart';

class DetailedPage extends StatefulWidget {
  final Film film;
  const DetailedPage({required this.film, super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BackdropAndRating(size: size, movie: widget.film),
            SizedBox(height: Constants.defaultPadding / 2),
            MovieInfo(movie: widget.film),
            Genres(movie: widget.film),
            widget.film.extract != null
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Constants.defaultPadding,
                        left: Constants.defaultPadding,
                        bottom: 16.sp,
                      ),
                      child: Text(
                        "Plot Summary",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Constants.defaultPadding,
                      ),
                      child: Text(
                        widget.film.extract ?? "",
                        style: TextStyle(color: Color(0xFF737599)),
                      ),
                    ),
                  ],
                )
                : SizedBox(),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            //   child: Text(movie.plot, style: TextStyle(color: Color(0xFF737599))),
            // ),
            // CastAndCrew(casts: movie.cast),
          ],
        ),
      ),
    );
  }
}
