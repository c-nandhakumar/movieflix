import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants.dart';

class MovieSection extends StatefulWidget {
  @override
  _MovieSectionState createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  int selectedCategory = 0;
  List<String> categories = ["In Theater", "Box Office", "Coming Soon"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12.h, bottom: 48.h),
      height: 84.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategory(index, context),
      ),
    );
  }

  Padding buildCategory(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
                color:
                    index == selectedCategory
                        ? Constants.textColor
                        : Constants.textColor.withValues(alpha: 0.3),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.h),
              height: 6.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    index == selectedCategory
                        ? Constants.primaryColor
                        : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
