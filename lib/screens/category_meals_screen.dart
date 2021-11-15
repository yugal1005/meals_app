import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meals_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/category-meals";
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen({
  //   this.categoryId,
  //   this.categoryTitle,
  // });
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    final categoryTitle = routeArgs["title"];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeal[index].id,
              affordability: categoryMeal[index].affordability,
              complexity: categoryMeal[index].complexity,
              duration: categoryMeal[index].duration,
              imgUrl: categoryMeal[index].imageUrl,
              title: categoryMeal[index].title,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
