import 'package:flutter/material.dart';

class TicketDetailScreen extends StatelessWidget {
  final String match;
  final String date;
  final String stadium;
  final String seats;

  const TicketDetailScreen({
    super.key,
    required this.match,
    required this.date,
    required this.stadium,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(match),
        backgroundColor:Color.fromARGB(255, 29, 45, 190),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.sports_soccer, size: 50, color: Color.fromARGB(255, 0, 0, 0)),
                const SizedBox(height: 20),
                Text("Match: $match", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Date: $date", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                Text("Stadium: $stadium", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                Text("Seats Available: $seats", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Back"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
