import '../models/cart_item.dart';
import '../models/menu_item.dart';

class CartService {
  static List<CartItem> cart = [];

  static void addToCart(MenuItem item) {
    var existing = cart.firstWhere(
      (cartItem) => cartItem.item.id == item.id,
      orElse: () => CartItem(item: item, quantity: 0),
    );

    if (existing.quantity == 0) {
      cart.add(CartItem(item: item, quantity: 1));
    } else {
      existing.quantity++;
    }
  }

  static int total() {
    int sum = 0;
    for (var c in cart) {
      sum += c.item.priceVnd * c.quantity;
    }
    return sum;
  }

  static void clearCart() {
    cart.clear();
  }
}
