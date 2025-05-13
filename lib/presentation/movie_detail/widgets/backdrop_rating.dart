import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';

class BackdropAndRating extends StatelessWidget {
  final Size size;
  final Film movie;

  const BackdropAndRating({Key? key, required this.size, required this.movie})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Hero(
            tag: movie.thumbnail ?? movie.title ?? "",
            child: Container(
              height: size.height * 0.4 - 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movie.thumbnail ?? Constants.Placeholder),
                ),
              ),
            ),
          ),
          // Rating Box
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 121.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: Color(0xFF12153D).withValues(alpha: 0.2),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Constants.defaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset("assets/images/filled_star.svg"),
                          SizedBox(height: 4.h),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "8.2/",
                                  style: TextStyle(
                                    fontFamily: Constants.fontFamily,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: "10\n",
                                  style: TextStyle(
                                    fontFamily: Constants.fontFamily,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: "150,212",
                                  style: TextStyle(
                                    fontFamily: Constants.fontFamily,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.textColorLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Rate this
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SvgPicture.asset("assets/images/star.svg"),
                          SizedBox(height: Constants.defaultPadding / 4),
                          Text("Rate This", style: TextStyle()),
                        ],
                      ),
                    ),
                    // Metascore
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 24.h,
                            width: 28.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF51CF66),

                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              "86",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Text(
                            "Metascore",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "62 critic reviews",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Constants.textColorLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.chevron_left, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
