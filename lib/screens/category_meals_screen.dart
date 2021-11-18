import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meals_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = "/category-meals";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;
  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs["id"];
    categoryTitle = routeArgs["title"];
    displayedMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            duration: displayedMeal[index].duration,
            imgUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
