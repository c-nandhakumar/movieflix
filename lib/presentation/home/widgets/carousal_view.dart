import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';
import 'package:sample/presentation/movie_detail/detailed_page.dart';

class CarousalView extends StatefulWidget {
  final List<Film> films;
  const CarousalView({required this.films, Key? key}) : super(key: key);

  @override
  _CarousalViewState createState() => _CarousalViewState();
}

class _CarousalViewState extends State<CarousalView> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 0.85,
          child: PageView.builder(
            itemCount: widget.films.length,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            controller: _pageController,
            itemBuilder: (context, index) {
              return carouselView(index);
            },
          ),
        ),
      ],
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }

        return AnimatedOpacity(
          duration: Duration(milliseconds: 350),
          opacity: _currentPage == index ? 1 : 0.4,
          key: ValueKey(index),
          child: Transform.rotate(
            angle: pi * value,
            child: carouselCard(widget.films[index], _currentPage == index),
          ),
        );
      },
    );
  }

  Widget carouselCard(Film data, bool isVisible) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Hero(
              tag: data.thumbnail ?? data.title ?? "",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedPage(film: data),
                    ),
                  );
                },
                child: Container(
                  height: 458.h,
                  width: 310.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                        data.thumbnail ?? Constants.Placeholder,
                      ),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 40.h),
          height: 69.h,
          child:
              isVisible
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        data.title ?? "Movie",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 32.sp,
                          overflow: TextOverflow.clip,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/images/filled_star.svg",
                            height: 20,
                          ),
                          SizedBox(width: 9.w),
                          Text("8.2", style: TextStyle()),
                        ],
                      ),
                    ],
                  )
                  : SizedBox(),
        ),
      ],
    );
  }
}
