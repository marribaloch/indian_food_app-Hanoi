import '../models/restaurant_model.dart';

class RestaurantService {
  static List<Restaurant> getRestaurants() {
    return [
      Restaurant(
        id: '1',
        name: 'RK Spice Indian Restaurant',
        imageUrl: 'https://i.imgur.com/4YQeXPR.jpeg',
      ),
      Restaurant(
        id: '2',
        name: 'Indian Food Hanoi',
        imageUrl: 'https://i.imgur.com/9PLu7VV.jpeg',
      ),
      // بعد میں آپ یہاں مزید restaurants add کر سکتے ہیں
    ];
  }

  static Restaurant? getById(String id) {
    try {
      return getRestaurants().firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }
}
