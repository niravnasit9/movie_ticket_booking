import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';
import 'package:movie_ticket_booking/seatSelectionScreen.dart';

class ShowTimeChip extends StatelessWidget {
  final String theatreName;
  final String time;
  final Movie movie;
  final DateTime date;

  const ShowTimeChip({
    super.key,
    required this.theatreName,
    required this.time,
    required this.movie,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 10),
      child: ChoiceChip(
        label: Text(time),
        selected: false,
        side: const BorderSide(color: Colors.red, width: 1.2),
        onSelected: (_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SeatSelectionScreen(
                movie: movie,
                theatreName: theatreName,
                showTime: time,
                date: date,
              ),
            ),
          );
        },
      ),
    );
  }
}
