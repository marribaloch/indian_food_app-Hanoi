import 'package:flutter/material.dart';
import '../services/restaurant_service.dart';
import '../models/restaurant_model.dart';
import 'restaurant_menu.dart';

class CustomerHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = RestaurantService.getRestaurants();

    return Scaffold(
      appBar: AppBar(title: Text("Restaurants")),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];

          return Card(
            child: ListTile(
              leading: Image.network(
                restaurant.imageUrl,
                width: 60,
                fit: BoxFit.cover,
              ),
              title: Text(restaurant.name),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        RestaurantMenuScreen(restaurant: restaurant),
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
