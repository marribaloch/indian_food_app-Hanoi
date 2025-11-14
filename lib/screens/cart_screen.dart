// lib/screens/cart_screen.dart

import 'package:flutter/material.dart';
import '../services/cart_service.dart';
import '../services/order_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = CartService.cart;
    final total = CartService.total();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final c = cartItems[index];

                return ListTile(
                  title: Text("${c.item.name} x ${c.quantity}"),
                  trailing: Text("${c.item.priceVnd * c.quantity} ₫"),
                );
              },
            ),
          ),

          // Total Price
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Total: $total ₫",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Place Order Button
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                // فی الحال RestaurantId = "1" (RK Spice)
                OrderService.placeOrder("1");

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Order Placed!"),
                    duration: Duration(seconds: 2),
                  ),
                );

                Navigator.pop(context); // واپس menu پر
              },
              child: const Text("Place Order"),
            ),
          )
        ],
      ),
    );
  }
}
