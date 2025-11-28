import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/infoRowWidget.dart';
import 'package:movie_ticket_booking/movies.dart';
import 'package:movie_ticket_booking/seatSelectionPopupDialog.dart';
import 'package:movie_ticket_booking/theatreSelection.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Movie movie;
  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          movie.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Poster
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
            child: Image.network(
              movie.posterUrl,
              height: 420,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoRowWidget(
                          icon: Icons.access_time_filled,
                          title: "Duration",
                          value: movie.time,
                        ),
                        const SizedBox(height: 14),
                        InfoRowWidget(
                          icon: Icons.movie_filter_rounded,
                          title: "Genre",
                          value: movie.type,
                        ),
                        const SizedBox(height: 14),
                        InfoRowWidget(
                          icon: Icons.calendar_month,
                          title: "Release Year",
                          value: "${movie.year}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent.shade700,
                minimumSize: const Size(double.infinity, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () async {
                final seat = await showSeatSelectionBottomSheet(
                  context,
                  movie.title,
                );

                if (seat != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              TheatreSelectionScreen(movie: movie, seat: seat),
                    ),
                  );
                }
              },
              child: const Text(
                "Book Ticket",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
