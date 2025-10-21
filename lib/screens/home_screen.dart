import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/preferences_helper.dart';
import 'ticket_list_screen.dart';
import '../providers/cart_provider.dart';
import 'web_view_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _deviceInfo;
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
    _saveUserData();
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final helper = PreferencesHelper(prefs: prefs);
    await helper.saveUser(widget.username);
  }

  Future<void> _getDeviceInfo() async {
    try {
      final androidInfo = await deviceInfo.androidInfo;
      setState(() {
        _deviceInfo = '${androidInfo.brand} ${androidInfo.model}\\n'
                     'Android ${androidInfo.version.release}';
      });
    } catch (e) {
      setState(() {
        _deviceInfo = 'Could not get device info';
      });
    }
  }

  final List<Map<String, dynamic>> competitions = [
    {
      "title": "UEFA Champions League",
      "icon": "assets/images/ucl.png",
      "matches": [
        {"match": "Real Madrid vs Barcelona", "date": "25 Sep 2025", "stadium": "Santiago Bernabeu", "seats": "15,000"},
        {"match": "Bayern vs Man City", "date": "26 Sep 2025", "stadium": "Allianz Arena", "seats": "13,500"},
        {"match": "Liverpool vs PSG", "date": "27 Sep 2025", "stadium": "Anfield", "seats": "12,000"},
        {"match": "Inter Milan vs Chelsea", "date": "28 Sep 2025", "stadium": "San Siro", "seats": "14,200"},
      ]
    },
    {
      "title": "UEFA Europa League",
      "icon": "assets/images/uefa.png",
      "matches": [
        {"match": "Roma vs Sevilla", "date": "29 Sep 2025", "stadium": "Stadio Olimpico", "seats": "10,000"},
        {"match": "Arsenal vs Villarreal", "date": "30 Sep 2025", "stadium": "Emirates Stadium", "seats": "11,500"},
        {"match": "Betis vs Atalanta", "date": "1 Okt 2025", "stadium": "Benito Villamarin", "seats": "9,000"},
      ]
    },
    {
      "title": "FIFA World Cup",
      "icon": "assets/images/pildun.png",
      "matches": [
        {"match": "Brazil vs Argentina", "date": "2 Okt 2025", "stadium": "Maracana", "seats": "50,000"},
        {"match": "France vs Germany", "date": "3 Okt 2025", "stadium": "Berlin Stadium", "seats": "48,000"},
        {"match": "Spain vs Portugal", "date": "4 Okt 2025", "stadium": "Camp Nou", "seats": "52,000"},
        {"match": "England vs Netherlands", "date": "5 Okt 2025", "stadium": "Wembley", "seats": "49,500"},
      ]
    },
    {
      "title": "Timnas Indonesia",
      "icon": "assets/images/king.png",
      "matches": [
        {"match": "Indonesia vs Malaysia", "date": "6 Okt 2025", "stadium": "GBK", "seats": "60,000"},
        {"match": "Indonesia vs Thailand", "date": "7 Okt 2025", "stadium": "GBK", "seats": "60,000"},
      ]
    },
  ];

  Widget _buildCompetitionCard(BuildContext context, String title, String iconPath, List matches) {
    return OpenContainer(
      closedElevation: 4,
      closedColor: Colors.white,
      closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (context, _) => TicketListScreen(
        competitionName: title,
        matches: List<Map<String, String>>.from(matches),
      ),
      closedBuilder: (context, openContainer) => GestureDetector(
        onTap: openContainer,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 80, height: 80),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, String title, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('$title coming soon!'),
              duration: const Duration(seconds: 2),
            ));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
                  child: Icon(icon, size: 28, color: color),
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
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
    final mainColor = Colors.blue.shade900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text("Football Ticket", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              Consumer<CartProvider>(
                builder: (context, cart, _) => Positioned(
                  right: 8,
                  top: 8,
                  child: cart.itemCount == 0
                      ? const SizedBox()
                      : Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                          constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                          child: Text('${cart.itemCount}', style: const TextStyle(color: Colors.white, fontSize: 10)),
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const Icon(Icons.person, color: Colors.white),
          const SizedBox(width: 5),
          Text("Hi, ${widget.username}", style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(width: 12),
        ],
      ),

      // 🔹 Drawer Menu
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: mainColor,
                image: const DecorationImage(
                  image: AssetImage('assets/images/ucl.png'),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 35, color: Colors.blue),
                    ),
                    const SizedBox(height: 8),
                    Text(widget.username,
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    if (_deviceInfo != null)
                      Text(_deviceInfo!,
                          style: const TextStyle(color: Colors.white70, fontSize: 12)),
                    const Text("Football Fan", style: TextStyle(color: Colors.white70, fontSize: 14)),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.confirmation_number, color: Colors.blue),
              title: const Text("My Tickets"),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming soon!"))),
            ),
            ListTile(
              leading: const Icon(Icons.event, color: Colors.orange),
              title: const Text("Upcoming Matches"),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming soon!"))),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.green),
              title: const Text("Profile"),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Coming soon!"))),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () => _showLogoutDialog(context),
            ),
          ],
        ),
      ),

      // 🔹 Body utama
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔸 Bagian Kompetisi
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Featured Competitions",
                        style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: competitions.length,
                        itemBuilder: (context, index) {
                          final comp = competitions[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: _buildCompetitionCard(
                              context,
                              comp["title"],
                              comp["icon"],
                              comp["matches"],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🔸 Quick Actions Full Width
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Quick Actions",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                  const SizedBox(height: 16),
                  _buildActionCard(context, "My Tickets", Icons.confirmation_number, Colors.blue),
                  Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                url: "https://www.bola.net/jadwal-pertandingan/",
                                title: "Jadwal Pertandingan",
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.15),
                                  shape: BoxShape.circle
                                ),
                                child: Icon(Icons.event, size: 28, color: Colors.orange),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "Upcoming Matches",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  _buildActionCard(context, "Profile", Icons.person, Colors.green),
                  _buildActionCard(context, "Settings", Icons.settings, Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
