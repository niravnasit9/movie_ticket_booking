import 'package:flutter/material.dart';

class ShowTimeChip extends StatelessWidget {
  final String theatreName;
  final String time;

  const ShowTimeChip({
    super.key,
    required this.theatreName,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(label: Text(time), selected: false);
  }
}
