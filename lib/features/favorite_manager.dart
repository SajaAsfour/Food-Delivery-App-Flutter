import 'package:food_app/core/models/food_model.dart';

class FavoriteManager {
  static Set<FoodItem> favoriteItems = {};
  
  // Method to add or remove a favorite item
  static void toggleFavorite(FoodItem item) {
    if (favoriteItems.contains(item)) {
      favoriteItems.remove(item);
    } else {
      favoriteItems.add(item);
    }
  }
}
