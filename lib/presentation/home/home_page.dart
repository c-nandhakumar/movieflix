import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample/bloc/film_bloc.dart';
import 'package:sample/constants.dart';
import 'package:sample/presentation/home/widgets/carousal_view.dart';
import 'package:sample/presentation/home/widgets/genre_widget.dart';
import 'package:sample/presentation/home/widgets/movie_sections.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocBuilder<FilmBloc, FilmState>(
        builder: (context, state) {
          if (state is FilmLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return buildBody(state);
          } else if (state is MovieError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Error: ${state.message}'),
              ),
            );
          } else {
            return Center(child: Text('No data.'));
          }
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: Constants.defaultPadding - 10),
        icon: SvgPicture.asset("assets/images/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
          icon: SvgPicture.asset("assets/images/search.svg"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildBody(MovieLoaded state) {
    return ListView(
      shrinkWrap: true,
      children: [
        MovieSection(),
        Genres(),
        SizedBox(height: 72.h),
        CarousalView(films: state.movies),
      ],
    );
  }
}
