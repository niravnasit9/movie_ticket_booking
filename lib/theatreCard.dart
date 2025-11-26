import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/showTimeChip.dart';

class TheatreCard extends StatelessWidget {
  final String name;
  const TheatreCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            Wrap(
              children: [
                ShowTimeChip(theatreName: name, time: "10:30 AM"),
                ShowTimeChip(theatreName: name, time: "1:15 PM"),
                ShowTimeChip(theatreName: name, time: "4:00 PM"),
                ShowTimeChip(theatreName: name, time: "7:00 PM"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
