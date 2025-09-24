import 'package:flutter/material.dart';
import 'ticket_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> competitions = [
      {
        "title": "UEFA Champions League",
        "icon": "assets/images/ucl.png",
        "matches": [
          {
            "match": "Real Madrid vs Barcelona",
            "date": "25 September 2025",
            "stadium": "Santiago Bernabeu",
            "seats": "15,000"
          },
          {
            "match": "Bayern vs Man City",
            "date": "26 September 2025",
            "stadium": "Allianz Arena",
            "seats": "13,500"
          },
          {
            "match": "Liverpool vs PSG",
            "date": "27 September 2025",
            "stadium": "Anfield",
            "seats": "12,000"
          },
          {
            "match": "Inter Milan vs Chelsea",
            "date": "28 September 2025",
            "stadium": "San Siro",
            "seats": "14,200"
          },
        ]
      },
      {
        "title": "UEFA Europa League",
        "icon": "assets/images/uefa.png",
        "matches": [
          {
            "match": "Roma vs Sevilla",
            "date": "29 September 2025",
            "stadium": "Stadio Olimpico",
            "seats": "10,000"
          },
          {
            "match": "Arsenal vs Villarreal",
            "date": "30 September 2025",
            "stadium": "Emirates Stadium",
            "seats": "11,500"
          },
          {
            "match": "Betis vs Atalanta",
            "date": "1 Oktober 2025",
            "stadium": "Benito Villamarin",
            "seats": "9,000"
          },
        ]
      },
      {
        "title": "FIFA World Cup",
        "icon": "assets/images/pildun.png",
        "matches": [
          {
            "match": "Brazil vs Argentina",
            "date": "2 Oktober 2025",
            "stadium": "Maracana",
            "seats": "50,000"
          },
          {
            "match": "France vs Germany",
            "date": "3 Oktober 2025",
            "stadium": "Berlin Stadium",
            "seats": "48,000"
          },
          {
            "match": "Spain vs Portugal",
            "date": "4 Oktober 2025",
            "stadium": "Camp Nou",
            "seats": "52,000"
          },
          {
            "match": "England vs Netherlands",
            "date": "5 Oktober 2025",
            "stadium": "Wembley",
            "seats": "49,500"
          },
        ]
      },
      {
        "title": "Timnas Indonesia",
        "icon": "assets/images/king.png",
        "matches": [
          {
            "match": "Indonesia vs Malaysia",
            "date": "6 Oktober 2025",
            "stadium": "GBK",
            "seats": "60,000"
          },
          {
            "match": "Indonesia vs Thailand",
            "date": "7 Oktober 2025",
            "stadium": "GBK",
            "seats": "60,000"
          },
        ]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.redAccent,
        actions: [
          Row(
            children: [
              const Icon(Icons.person, size: 20),
              const SizedBox(width: 6),
              Text("Welcome, $username"),
              const SizedBox(width: 12),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: competitions.length,
        itemBuilder: (context, index) {
          final comp = competitions[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: Image.asset(comp["icon"], width: 40, height: 40, fit: BoxFit.contain),
              title: Text(comp["title"], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${comp["matches"].length} matches"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TicketListScreen(
                      competitionName: comp["title"],
                      matches: List<Map<String, String>>.from(comp["matches"]),
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
