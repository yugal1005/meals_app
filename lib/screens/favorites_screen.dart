import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Text("You have no Favorites yeat - Go add some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            duration: favoriteMeal[index].duration,
            imgUrl: favoriteMeal[index].imageUrl,
            title: favoriteMeal[index].title,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
