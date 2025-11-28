import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';
import 'package:movie_ticket_booking/theatreCard.dart';

class TheatreSelectionScreen extends StatefulWidget {
  final Movie movie;
  final int seat;
  const TheatreSelectionScreen({
    super.key,
    required this.movie,
    required this.seat,
  });

  @override
  State<TheatreSelectionScreen> createState() => _TheatreSelectionScreenState();
}

class _TheatreSelectionScreenState extends State<TheatreSelectionScreen> {
  int selectedDateIndex = 0;

  final List<DateTime> dates = List.generate(
    7,
    (i) => DateTime.now().add(Duration(days: i)),
  );

  String _dayName(int weekday) {
    switch (weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      default:
        return "Sun";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Theatre • ${widget.movie.title}")),

      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final date = dates[index];
                  bool isSelected = index == selectedDateIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },

                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding: EdgeInsets.all(12),

                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.red.shade200,
                          width: 1.3,
                        ),
                      ),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${date.day}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.red,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            _dayName(date.weekday),
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  isSelected
                                      ? Colors.white
                                      : Colors.red.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15),

            Expanded(
              child: ListView(
                children: [
                  TheatreCard(
                    name: "PVR",
                    movie: widget.movie,
                    date: dates[selectedDateIndex],
                  ),
                  TheatreCard(
                    name: "Cinepolis",
                    movie: widget.movie,
                    date: dates[selectedDateIndex],
                  ),
                  TheatreCard(
                    name: "Miraj Cinemas",
                    movie: widget.movie,
                    date: dates[selectedDateIndex],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
