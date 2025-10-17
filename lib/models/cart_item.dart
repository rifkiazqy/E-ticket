class CartItem {
  final String match;
  final String date;
  final String stadium;
  final String seats;
  final int quantity;
  final double price;

  CartItem({
    required this.match,
    required this.date,
    required this.stadium,
    required this.seats,
    required this.quantity,
    required this.price,
  });

  double get total => price * quantity;

  CartItem copyWith({
    String? match,
    String? date,
    String? stadium,
    String? seats,
    int? quantity,
    double? price,
  }) {
    return CartItem(
      match: match ?? this.match,
      date: date ?? this.date,
      stadium: stadium ?? this.stadium,
      seats: seats ?? this.seats,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}