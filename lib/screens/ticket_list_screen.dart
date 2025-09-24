import 'package:flutter/material.dart';
import 'ticket_detail_screen.dart';

class TicketListScreen extends StatelessWidget {
  final String competitionName;
  final List<Map<String, String>> matches;

  const TicketListScreen({
    super.key,
    required this.competitionName,
    required this.matches,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(competitionName),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(match["match"] ?? ""),
              subtitle: Text(match["date"] ?? ""),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TicketDetailScreen(
                      match: match["match"]!,
                      date: match["date"]!,
                      stadium: match["stadium"]!,
                      seats: match["seats"]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
