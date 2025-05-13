import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({Key? key, required this.movie}) : super(key: key);

  final Film movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.defaultPadding),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title ?? "Movie",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Constants.defaultPadding / 2),
                Row(
                  children: <Widget>[
                    Text(
                      '${movie.year}',
                      style: TextStyle(
                        color: Constants.textColorLight,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: Constants.defaultPadding),
                    Text(
                      "PG-13",
                      style: TextStyle(
                        color: Constants.textColorLight,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: Constants.defaultPadding),
                    Text(
                      "2h 32min",
                      style: TextStyle(
                        color: Constants.textColorLight,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: FloatingActionButton(
              backgroundColor: Constants.primaryColor,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.add, size: 28, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
