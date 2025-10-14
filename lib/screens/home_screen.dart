import 'package:flutter/material.dart';
import 'ticket_list_screen.dart';
import 'login_screen.dart';



class HomeScreen extends StatelessWidget {
  final String username;
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

  HomeScreen({super.key, required this.username});

  Widget _buildCompetitionCard(String title, String iconPath) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 160,
        height: 160,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title coming soon!'),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: color),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF3F0FB7),
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text("Yes, Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F0FB7),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Football Ticket',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Icon(Icons.person, size: 22, color: Colors.white),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                "Welcome, $username",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF3F0FB7),
                image: DecorationImage(
                  image: AssetImage('assets/images/ucl.png'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 35,
                      color: Color(0xFF3F0FB7),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Football Fan',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.confirmation_number, color: Color.fromARGB(255, 31, 5, 148)),
              title: const Text('My Tickets'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('My Tickets coming soon!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Color.fromARGB(255, 20, 7, 131)),
              title: const Text('Upcoming Matches'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Upcoming Matches coming soon!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color: Color.fromARGB(255, 32, 10, 160)),
              title: const Text('Profile'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Profile coming soon!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 8, 6, 155)),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF3F0FB7),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    right: -30,
                    bottom: -30,
                    child: Icon(
                      Icons.sports_soccer,
                      size: 200,
                      color: Colors.white10,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Featured Competitions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: competitions.length,
                            itemBuilder: (context, index) {
                              final comp = competitions[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TicketListScreen(
                                          competitionName: comp["title"],
                                          matches: List<Map<String, String>>.from(
                                              comp["matches"]),
                                        ),
                                      ),
                                    );
                                  },
                                  child: _buildCompetitionCard(
                                    comp["title"],
                                    comp["icon"],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _buildActionCard(
                        context,
                        'My Tickets',
                        Icons.confirmation_number,
                        Colors.blue,
                      ),
                      _buildActionCard(
                        context,
                        'Upcoming Matches',
                        Icons.event,
                        Colors.orange,
                      ),
                      _buildActionCard(
                        context,
                        'Profile',
                        Icons.person,
                        Colors.green,
                      ),
                      _buildActionCard(
                        context,
                        'Settings',
                        Icons.settings,
                        Colors.purple,
                      ),
                    ],
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
