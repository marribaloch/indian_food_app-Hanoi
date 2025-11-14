import 'menu_item.dart';

class CartItem {
  final MenuItem item;
  int qty;

  CartItem({
    required this.item,
    this.qty = 1,
  });
}
