import 'package:flutter/material.dart';
import '../services/restaurant_service.dart';
import '../models/restaurant_model.dart';
import 'restaurant_home.dart';

class RestaurantSelectScreen extends StatelessWidget {
  const RestaurantSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants = RestaurantService.getRestaurants();

    return Scaffold(
      appBar: AppBar(title: const Text("Select Restaurant")),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final r = restaurants[index];
          return Card(
            child: ListTile(
              title: Text(r.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RestaurantHomeScreen(restaurantId: r.id),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
