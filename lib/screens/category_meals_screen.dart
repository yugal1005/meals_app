import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

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
    final categorMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categorMeal[index].title);
          },
          itemCount: categorMeal.length,
        ));
  }
}
