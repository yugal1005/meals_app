import "package:flutter/foundation.dart";

enum Complexity {
  simple,
  chalenging,
  hard,
}

enum Affordability {
  cheap,
  pricey,
  luxurious,
}

class Meal {
  final int id;
  final List<String> categories;
  final String imageUrl;
  final String title;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactosFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.affordability,
    @required this.categories,
    @required this.complexity,
    @required this.duration,
    @required this.id,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.isGlutenFree,
    @required this.isLactosFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
    @required this.title,
  });
}
