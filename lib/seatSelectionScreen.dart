import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';

class SeatSelectionScreen extends StatefulWidget {
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
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = [];
  final int seatPrice = 250;

  int get totalPrice {
    return selectedSeats.length * seatPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(widget.theatreName),
              Text(
                "${widget.date.day}/${widget.date.month}/${widget.date.year} • ${widget.showTime}",
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                ),
                itemCount: 100,
                itemBuilder: (context, index) {
                  int row = index ~/ 10;
                  int col = index % 10;

                  String seatId = "${String.fromCharCode(65 + row)}${col + 1}";

                  bool selected = selectedSeats.contains(seatId);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected
                            ? selectedSeats.remove(seatId)
                            : selectedSeats.add(seatId);
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selected ? Colors.red : Colors.white,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        seatId,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total seats:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  selectedSeats.isEmpty
                      ? const SizedBox()
                      : Text(
                        "${selectedSeats.length}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total amount:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  selectedSeats.isEmpty
                      ? const SizedBox()
                      : Text(
                        "$totalPrice",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
                  selectedSeats.isEmpty
                      ? SizedBox()
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Pay ₹$totalPrice",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
