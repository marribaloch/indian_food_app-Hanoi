return Card(
  child: ListTile(
    title: Text('Order #${o.id} – ${o.totalVnd} ₫'),
    subtitle: Text(itemsText),
  ),
);
import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../models/restaurant_model.dart';
import '../services/order_service.dart';

class RestaurantHomeScreen extends StatefulWidget {
  final Restaurant? restaurant;

  const RestaurantHomeScreen({super.key, this.restaurant});

  @override
  State<RestaurantHomeScreen> createState() => _RestaurantHomeScreenState();
}

class _RestaurantHomeScreenState extends State<RestaurantHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Order> orders = widget.restaurant == null
        ? OrderService.getAll()
        : OrderService.getForRestaurant(widget.restaurant!.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.restaurant == null
              ? 'Restaurant – Incoming Orders'
              : '${widget.restaurant!.name} – Incoming Orders',
        ),
      ),
      body: orders.isEmpty
          ? const Center(child: Text('No orders yet'))
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final o = orders[index];
                final itemsText =
                    o.items.map((i) => i.name).join(', ');

                return Card(
                  child: ListTile(
                    title: Text('Order #${o.id} – ${o.totalVnd} ₫'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itemsText),
                        const SizedBox(height: 4),
                        Text('Status: ${o.status}'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  OrderService.updateStatus(o.id, 'accepted');
                                });
                              },
                              child: const Text('Accept'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  OrderService.updateStatus(o.id, 'preparing');
                                });
                              },
                              child: const Text('Preparing'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  OrderService.updateStatus(o.id, 'ready');
                                });
                              },
                              child: const Text('Ready'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
