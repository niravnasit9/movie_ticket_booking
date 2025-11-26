import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';
import 'package:movie_ticket_booking/showTimeChip.dart';

class TheatreCard extends StatefulWidget {
  final String name;
  final Movie movie;
  final DateTime date;

  const TheatreCard({
    super.key,
    required this.name,
    required this.movie,
    required this.date,
  });

  @override
  State<TheatreCard> createState() => _TheatreCardState();
}

class _TheatreCardState extends State<TheatreCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Wrap(
              children: [
                ShowTimeChip(
                  theatreName: widget.name,
                  time: "10:30 AM",
                  movie: widget.movie,
                  date: widget.date,
                ),
                ShowTimeChip(
                  theatreName: widget.name,
                  time: "1:15 PM",
                  movie: widget.movie,
                  date: widget.date,
                ),
                ShowTimeChip(
                  theatreName: widget.name,
                  time: "4:00 PM",
                  movie: widget.movie,
                  date: widget.date,
                ),
                ShowTimeChip(
                  theatreName: widget.name,
                  time: "7:00 PM",
                  movie: widget.movie,
                  date: widget.date,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
