import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';
import 'package:movie_ticket_booking/theatreCard.dart';

class TheatreSelectionScreen extends StatefulWidget {
  final Movie movie;
  const TheatreSelectionScreen({super.key, required this.movie});

  @override
  State<TheatreSelectionScreen> createState() => _TheatreSelectionScreenState();
}

int selectedDateIndex = 0;
List<DateTime> dates = List.generate(
  7,
  (i) => DateTime.now().add(Duration(days: i)),
);

class _TheatreSelectionScreenState extends State<TheatreSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Theatre")),
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
                      setState(() => selectedDateIndex = index);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.red : Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.red.shade200,
                          width: 1.2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${date.day}",
                            style: TextStyle(
                              fontSize: 20,
                              color: isSelected ? Colors.white : Colors.red,
                              fontWeight: FontWeight.bold,
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
                  TheatreCard(name: "PVR"),
                  TheatreCard(name: "Cinepolis"),
                  TheatreCard(name: "Miraj Cinemas"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
