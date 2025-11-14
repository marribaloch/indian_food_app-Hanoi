import 'menu_item.dart';

class Order {
  final String id;
  final String restaurantId;
  final List<MenuItem> items;
  final int totalVnd;

  String status; // new: "new", "accepted", "preparing", "ready"

  Order({
    required this.id,
    required this.restaurantId,
    required this.items,
    required this.totalVnd,
    this.status = 'new',
  });
}
