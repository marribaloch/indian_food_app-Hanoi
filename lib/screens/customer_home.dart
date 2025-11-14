import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../services/restaurant_service.dart';
import 'restaurant_menu.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurants = RestaurantService.getRestaurants();

    return Scaffold(
      appBar: AppBar(title: const Text('Select Restaurant')),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final r = restaurants[index];
          return ListTile(
            title: Text(r.name),
            subtitle: Text('ID: ${r.id}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantMenuScreen(restaurant: r),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
