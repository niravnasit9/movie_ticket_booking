import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';

class SeatSelectionScreen extends StatelessWidget {
  final Movie movie;
  final String theatreName;
  final String showTime;
  final DateTime date;

  const SeatSelectionScreen({
    super.key,
    required this.movie,
    required this.theatreName,
    required this.showTime,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Seats")),
      body: Column(
        children: [
          Text("Movie: ${movie.title}", textAlign: TextAlign.center),
          Text("Theatre: $theatreName", textAlign: TextAlign.center),
          Text("Time: $showTime", textAlign: TextAlign.center),
          Text(
            "Date: ${date.day}/${date.month}/${date.year}",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
