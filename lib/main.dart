import 'package:flutter/material.dart';

import 'screens/customer_home.dart';
import 'screens/restaurant_home.dart';
import 'screens/driver_home.dart';

void main() {
  runApp(const IndianFoodApp());
}

class IndianFoodApp extends StatelessWidget {
  const IndianFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indian Food Hanoi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFE91E63),
      ),
      home: const RoleSelectScreen(),
    );
  }
}

class RoleSelectScreen extends StatelessWidget {
  const RoleSelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indian Food Hanoi'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: [
            RoleButton(
              text: 'Customer',
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CustomerHomeScreen()),
                );
              },
            ),
            RoleButton(
              text: 'Restaurant',
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RestaurantHomeScreen(),
                  ),
                );
              },
            ),
            RoleButton(
              text: 'Driver',
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DriverScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const RoleButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
