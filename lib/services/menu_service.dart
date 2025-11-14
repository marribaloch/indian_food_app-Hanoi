import '../models/menu_item.dart';

class MenuService {
  static List<MenuItem> getMenuForRestaurant(String restaurantId) {
    // ابھی dummy data ہے – بعد میں Firebase سے آئے گا
    if (restaurantId == '1') {
      return [
        MenuItem(id: 'm1', name: 'Chicken Biryani', priceVnd: 120000),
        MenuItem(id: 'm2', name: 'Butter Chicken', priceVnd: 150000),
        MenuItem(id: 'm3', name: 'Garlic Naan', priceVnd: 30000),
      ];
    } else {
      return [
        MenuItem(id: 'm4', name: 'Veg Thali', priceVnd: 130000),
        MenuItem(id: 'm5', name: 'Paneer Tikka', priceVnd: 140000),
        MenuItem(id: 'm6', name: 'Mango Lassi', priceVnd: 45000),
      ];
    }
  }
}
