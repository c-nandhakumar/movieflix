import 'package:flutter/material.dart';
import 'package:sample/constants.dart';
import 'package:sample/domain/film.dart';

class DetailedPage extends StatefulWidget {
  final Film film;
  const DetailedPage({required this.film, super.key});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Hero(
            tag: widget.film.thumbnail ?? Constants.Placeholder,
            child: Image(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                widget.film.thumbnail ?? Constants.Placeholder,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.film.title ?? "Unknown",
              style: const TextStyle(
                color: Color(0xFF12153D),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Text(
              "\Year: ${widget.film.year}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Plot Summary:",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  "${widget.film.extract}",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
