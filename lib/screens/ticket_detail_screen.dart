import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';
import '../providers/cart_provider.dart';
import '../models/cart_item.dart';
import '../utils/currency_formatter.dart';

class TicketDetailScreen extends StatelessWidget {
  final String match;
  final String date;
  final String stadium;
  final String seats;
  final double price = 500000; 

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
                Text("Match: $match", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))),
                const SizedBox(height: 8),
                Text("Date: $date", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                Text("Stadium: $stadium", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                Text("Seats Available: $seats", style: const TextStyle(fontSize: 16, color: Colors.black87)),
                Text(
                  "Price: ${CurrencyFormatter.formatRupiah(price)}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3F0FB7),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: GFButton(
                        onPressed: () => Navigator.pop(context),
                        text: "Back",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        color: Colors.grey,
                        type: GFButtonType.solid,
                        shape: GFButtonShape.pills,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GFButton(
                        onPressed: () {
                          final cart = context.read<CartProvider>();
                          cart.addItem(
                            CartItem(
                              match: match,
                              date: date,
                              stadium: stadium,
                              seats: seats,
                              quantity: 1,
                              price: price,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Ticket added to cart!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        text: "Add to Cart",
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        size: GFSize.LARGE,
                        fullWidthButton: true,
                        color: const Color(0xFF3F0FB7),
                        type: GFButtonType.solid,
                        shape: GFButtonShape.pills,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
