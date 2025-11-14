import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../models/menu_item.dart';
import '../models/cart_item.dart';
import '../services/menu_service.dart';
import '../services/order_service.dart';

class RestaurantMenuScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantMenuScreen({super.key, required this.restaurant});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final List<CartItem> _cart = [];

  List<MenuItem> get _menu =>
      MenuService.getMenuForRestaurant(widget.restaurant.id);

  int get _total =>
      _cart.fold<int>(0, (sum, c) => sum + c.item.priceVnd * c.qty);

  void _addToCart(MenuItem item) {
    setState(() {
      final existing =
          _cart.where((c) => c.item.id == item.id).toList();
      if (existing.isNotEmpty) {
        existing.first.qty += 1;
      } else {
        _cart.add(CartItem(item: item, qty: 1));
      }
    });
  }

  void _placeOrder() {
    if (_cart.isEmpty) return;
    OrderService.placeOrder(
      restaurantId: widget.restaurant.id,
      cartItems: _cart,
    );
    setState(() => _cart.clear());
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final menu = _menu;

    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurant.name)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menu.length,
              itemBuilder: (context, index) {
                final item = menu[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('${item.priceVnd} ₫'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () => _addToCart(item),
                  ),
                );
              },
            ),
          ),
          if (_cart.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Items: ${_cart.fold<int>(0, (s, c) => s + c.qty)}'),
                  Text('Total: $_total ₫'),
                  ElevatedButton(
                    onPressed: _placeOrder,
                    child: const Text('Place order'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
