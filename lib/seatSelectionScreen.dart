import 'package:flutter/material.dart';
import 'package:movie_ticket_booking/movies.dart';

class SeatSelectionScreen extends StatefulWidget {
  final Movie movie;
  final String theatreName;
  final String showTime;
  final DateTime date;
  final int seat;

  const SeatSelectionScreen({
    super.key,
    required this.movie,
    required this.theatreName,
    required this.showTime,
    required this.date,
    required this.seat,
  });

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final List<String> bookedSeats = ["A1", "A2", "B5", "D7", "E3", "J10"];
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
                  int reversedRow = 9 - row;

                  String seatId =
                      "${String.fromCharCode(65 + reversedRow)}${col + 1}";

                  bool isSelected = selectedSeats.contains(seatId);
                  bool isBooked = bookedSeats.contains(seatId);

                  return GestureDetector(
                    onTap: () {
                      if (isBooked) return;

                      setState(() {
                        isSelected
                            ? selectedSeats.remove(seatId)
                            : selectedSeats.add(seatId);
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            isBooked
                                ? Colors.grey.shade400
                                : isSelected
                                ? Colors.green
                                : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: isBooked ? Colors.grey : Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        seatId,
                        style: TextStyle(
                          color:
                              isBooked
                                  ? Colors.white
                                  : isSelected
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                    bottom: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Text(
                  "SCREEN THIS SIDE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total selected seats:",
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
